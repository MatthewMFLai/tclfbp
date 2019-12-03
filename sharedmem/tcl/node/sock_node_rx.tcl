# Echo_Server --
#	Open the server listening socket
#	and enter the Tcl event loop
#
# Arguments:
#	port	The server's port number

proc Echo_Server {port} {
    set s [socket -server EchoAccept $port]
    #vwait forever
}

# Echo_Accept --
#	Accept a connection from a new client.
#	This is called after a new socket connection
#	has been created by Tcl.
#
# Arguments:
#	sock	The new socket connection to the client
#	addr	The client's IP address
#	port	The client's port number
	
proc EchoAccept {sock addr port} {
    global echo

    # Record the client's information

    puts "Accept $sock from $addr port $port"
    set echo(addr,$sock) [list $addr $port]

    # Ensure that each "puts" by the server
    # results in a network transmission

    fconfigure $sock -buffering line

    # Set up a callback for when the client sends data

    fileevent $sock readable [list EchoMatchKey $sock]
}

# EchoMatchKey --
#	This procedure is called when the server
#	reads the very first data line from the client
#       containing the shared memory key name.
#
# Arguments:
#	sock	The socket connection to the client

proc EchoMatchKey {sock} {
    global g_coroutines
	global g_key

    # Check end of file or abnormal connection drop,
    # then echo data back to the client.
	set key_prefix "-RX"

    if {[eof $sock] || [catch {gets $sock line}]} {
		close $sock
    } else {
		set id [lindex $line 0]
		set key [lindex $line 1]
		if {![info exists g_key($id)]} {
			puts $sock "$id $key ERROR"
		} elseif {[lsearch $g_key($id) $key$key_prefix] > -1} {
        	puts $sock "$id $key OK"
			# The received key may be aa-bb while the real key is
			# aa-bb-RX. Use the real key for subsequent coroutine
			# creation.
			set idx [lsearch $g_key($id) $key$key_prefix]
			set key [lindex $g_key($id) $idx]
		} else {
			puts $sock "$id $key ERROR"
		}
        # Create coroutine if shared memory key is valid
        coroutine $key-$sock process_rx $key
        set g_coroutines($key-$sock) "WAIT_SOCK" 
        fileevent $sock readable [list Echo $sock]
    }
}

# Echo --
#	This procedure is called when the server
#	can read data from the client
#
# Arguments:
#	sock	The socket connection to the client

proc Echo {sock} {
    global g_coroutines

    # Check end of file or abnormal connection drop,
    # then echo data back to the client.

    if {[eof $sock] || [catch {gets $sock request}]} {
	close $sock
    } else {
        # Custom code to handle request from remote sock node.
        #
        set co_name [array names g_coroutines "*-$sock"]
        if {$co_name != ""} {
            if {$g_coroutines($co_name) == "WAIT_SOCK"} {
                set g_coroutines($co_name) [$co_name $request]
            } else {
                puts "ERR: wrong coroutine state $g_coroutines($co_name)" 
            } 
        } 
    }
}

#
# Admin client
#

proc handle_keys {id keylist} {
	global g_key

	# keydata looks like
	# {<key>:<size>:<len> ... }
	if {![info exists g_key($id)]} {
		set g_key($id) ""
	}
	foreach keydata $keylist { 
    	set tokens [split $keydata ":"]
    	set key [lindex $tokens 0]
    	set size [lindex $tokens 1]
    	set len [lindex $tokens 2]

    	key_mgr_add $key $size
    	stub_init $key $len $size
		lappend g_key($id) $key
	}
}

proc handle_keys_remove {id keylist} {
	global g_key
    global g_coroutines

	if {![info exists g_key($id)]} {
		return	
	}
	# keydata looks like
	# {<key>:<size>:<len> ... }
	foreach token $keylist {
		set key [lindex $token 0]
        foreach co_name [array names g_coroutines "$key-*"] {
			rename $co_name {}
		}
		set idx [lsearch $g_key($id) $key]
		if {$idx != -1} {
			set g_key($id) [lreplace $g_key($id) $idx $idx]
		} 
	}
}

proc handle_admin {keydata} {
	set cmd [lindex $keydata 0]
	set id [lindex $keydata 1]
	if {$cmd == "KEYS"} {
		handle_keys $id [lindex $keydata 2]
	} elseif {$cmd == "KEYS_REMOVE"} {
		handle_keys_remove $id [lindex $keydata 2]
	}
	return "$cmd $id OK"
}

proc Admin_Client {host port} {
    set s [socket $host $port]
	puts $s "sock rx connected"
	flush $s
    fconfigure $s -buffering line
    fileevent $s readable "Admin_Client_Handle $s"
    return $s
}

proc Admin_Client_Handle {cid} {
    if {[gets $cid request] < 0} {
        close $cid
        # Kludge: for testing only!!!
        exit 0
    } else {
        # Custom code to handle request.
        #
		set resp [handle_admin $request]
		puts $cid $resp
		flush $cid
    }
}

#-------------------------------------------------------------------
proc process_rx {key} {
    global g_coroutines

    while {1} {
        set bcd_msg [yield "WAIT_SOCK"]
        #puts "bcd_msg: $bcd_msg"
        key_mgr_bcd_set $key $bcd_msg

        set response ""
        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_write_wrapper $key [key_mgr_get_msg $key]]
            if {$rc == 0} {
                break
            }
            yield "WAIT_MEM"
        }

        set idx [array names g_coroutines $key-*]
        set sd [lindex [split $idx "-"] end]
        #puts "Tx: $bcd_msg"
        puts $sd $bcd_msg
    }
    return
}

#-------------------------------------------------------------------
proc checkagain {} {
    global g_running
    global g_coroutines

    if {$g_running} {
        foreach co_name [array names g_coroutines] {
            if {$g_coroutines($co_name) != "WAIT_MEM"} {
                continue
            }
            set g_coroutines($co_name) [$co_name "INVOKE_TIMER"]
        }
    }
    after 10 checkagain
}

#--------------------------------------------------------
# Config file is located at the default dir
set cfgfile $env(COMP_HOME)/ut_common/launcher_imp.cfg.def
set newcfgfile [lindex $argv 0]
if {$newcfgfile != "" && [file exists $newcfgfile]} {
	set cfgfile $newcfgfile
}
array set m_cfg {}
source $cfgfile
#--------------------------------------------------------

global g_coroutines
array set g_coroutines {}

load $env(TCLSHAREDMEM)/tclsharedmem[info sharedlibextension] tclsharedmem 
queue_init
key_mgr_init

# argument data looks like this:
# tclsh node_socif.tcl INIT localhost:8000 KEYS RX_PORT <rx port> 
#
array set g_key {} 

set initport $m_cfg(rx_accept) 
set initaddr "localhost"
set init_sd [Admin_Client $initaddr $initport]

set g_running 1 

after idle checkagain

set myip $m_cfg(ip)
Echo_Server $m_cfg($myip:port)
vwait main-loop 

exit
