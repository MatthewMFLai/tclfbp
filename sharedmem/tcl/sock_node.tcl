# Echo_Server --
#	Open the server listening socket
#	and enter the Tcl event loop
#
# Arguments:
#	port	The server's port number

proc Echo_Server {port} {
    set s [socket -server EchoAccept $port]
    vwait forever
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

    fileevent $sock readable [list Echo $sock]
}

# Echo --
#	This procedure is called when the server
#	can read data from the client
#
# Arguments:
#	sock	The socket connection to the client

proc Echo {sock} {
    global echo

    # Check end of file or abnormal connection drop,
    # then echo data back to the client.

    if {[eof $sock] || [catch {gets $sock line}]} {
	close $sock
	puts "Close $echo(addr,$sock)"
	unset echo(addr,$sock)
    } else {
	puts $sock $line
    }
}

#
# A client of the echo service.
#

proc Echo_Client {host port} {
    set s [socket $host $port]
    fconfigure $s -buffering line
    fileevent $s readable "Echo_Client_Handle $s"
    return $s
}

proc Echo_Client_Handle {cid} {
    global g_coroutines

    if {[gets $cid response] < 0} {
        close $cid
    } else {
        # Custom code to handle ack from remote sock node.
        #
        set co_name [array names g_coroutines "*-$cid"]
        if {$co_name != ""} {
            if {$g_coroutines($co_name) == "WAIT_SOCK"} {
                set g_coroutines($co_name) [$co_name $response]
            } else {
                puts "ERR: wrong coroutine state $g_coroutines($co_name)" 
            } 
        } 
    }
}

#
# Admin client
#

proc Admin_Client {host port} {
    set s [socket $host $port]
    fconfigure $s -buffering line
    fileevent $s readable "Admin_Client_Handle $s"
    return $s
}

proc Admin_Client_Handle {cid} {
    if {[gets $cid request] < 0} {
        close $cid
    } else {
        # Custom code to handle request.
        #
        #	
    }
}

# A sample client session looks like this
#   set s [Echo_Client localhost 2540]
#   puts $s "Hello!"
#   gets $s line

#--------------------------------------------------
# Socket interface code section

proc client_init {cid} {
    fileevent $cid readable "client_handle $cid"
    fconfigure $cid -buffering line
}

proc client_handle {cid} {
    if {[gets $cid request] < 0} {
	global main-loop
        close $cid
	set main-loop 1
    } else {
        # Custom code to handle initialization.
        #
	set response ""
        if {[initialize $request response]} {
	    puts $cid $response
	    flush $cid
	}
    }
}

proc initialize {request p_response} {
    global g_running

    upvar $p_response response
    set response ""
    set rc 0 

    switch -- [lindex $request 0] {
        INIT {
            set response [app_init] 
            set rc 1 
        }
        ENABLE {
            set g_running 1
            set response "App ruuning"
            set rc 1 
        }
        DISABLE {
            set g_running 0 
            set response "App stopped"
            set rc 1 
        }
        TEST {
            set response [app_test] 
            set rc 1 
        }
	default {
            set response "$request not recognized"
            set rc 1 
        }
    }
    return $rc
}
# End Socket interface code section
#-------------------------------------------------------------------
proc process {key} {
    global g_coroutines
    yield "WAIT_START"    

    while {1} {
        set response ""
        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_read_wrapper $key [key_mgr_get_msg $key]]
            if {$rc == 0} {
                break
            }
            set response [yield "WAIT_MEM"] 
        }
        set bcd_msg [key_mgr_bcd_get $key]

        set idx [array names g_coroutines $key-*]
        set sd [lindex [split $idx "-"] end]
        puts "Send: $bcd_msg"
        puts $sd $bcd_msg
        set rc 1 
        while {$rc != 0} {
            set response [yield "WAIT_SOCK"]
            puts "Receive: $response"
            if {$response != $bcd_msg} {
                puts "Invalid response: $response"
            } else {
                set rc 0
            }
        }
    }
    return
}

proc app_test {} {
    global g_msgcount

    return $g_msgcount
}

proc app_init {} {
    global g_msgcount

    set g_msgcount 0
    return "OK"
}
#-------------------------------------------------------------------
proc mem_write {key p_msgout} {
    upvar $p_msgout msgout

    Portmgr::Get_Portmsgdef $port msgname
    array set tmpdata {}
    Msgdef::Get_Attr_Offset $msgname tmpdata
    foreach attr [array names tmpdata] {
        if {![info exists msgout($attr)]} {
            continue
        }
        port_mgr_msg_set $port $msgout($attr) $tmpdata($attr)
    }

    Portmgr::Get_Shm $port keylist
    set rc 1 
    while {$rc != 0} {
        foreach shmkey $keylist {
            set rc [sv_csr_write_wrapper $shmkey [port_mgr_get_msg $port]]
            if {$rc == 0} {
                break
            }
        }
        if {$rc} {
            yield
        }
    }
}

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

global g_coroutines
array set g_coroutines {}

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem 
queue_init
key_mgr_init

# argument data looks like this:
# tclsh node_socif.tcl BLOCK s0:source0 INIT localhost:8000 KEYS {<from-ipaddr>:<from-port>:<to-ipaddr>:<to-port>:<key>:<size>:<len> ... }
#
array set argdata $argv 

foreach keydata $argdata(KEYS) { 
    set tokens [split $keydata ":"]
    set key [lindex $tokens 4]
    set size [lindex $tokens 5]
    set len [lindex $tokens 6]
    set from_ipaddr [lindex $tokens 0]
    set from_port [lindex $tokens 1]
    set to_ipaddr [lindex $tokens 2]
    set to_port [lindex $tokens 3]

    key_mgr_add $key $size
    stub_init $key $len $size
    set sd [Echo_Client $to_ipaddr $to_port]
    coroutine $key-$sd process $key
    set g_coroutines($key-$sd) "WAIT_MEM" 
} 

set g_running 1 

after idle checkagain

vwait main-loop 

exit
