#
# A client of the echo service.
#

proc Echo_Client {host port} {
    set s [socket $host $port]
    fconfigure $s -buffering line
    return $s
}

proc Echo_Client_Config {s} {
    fileevent $s readable "Echo_Client_Handle $s"
    return
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

proc handle_launcher_rqst {request p_response} {
    global g_running
    global g_name

    upvar $p_response response
    set response ""
    set rc 0 

    switch -- [lindex $request 0] {
        IDENT {
            set response "IDENT $g_name [pid]" 
            set rc 1 
        }
        INIT {
			handle_init
            set response "INIT ok" 
            set rc 1 
        }
        ENABLE {
            set g_running 1
            set response "ENABLE App ruuning"
            set rc 1 
        }
        DISABLE {
            set g_running 0 
            set response "DISABLE App stopped"
            set rc 1 
        }
        TEST {
            set response "TEST ok" 
            set rc 1 
        }
        SHUTDOWN {
            set rc 0 
        }
		default {
            set response "$request not recognized"
            set rc 1 
        }
    }
    return $rc
}

proc Admin_Client {host port} {
    set s [socket $host $port]
    fconfigure $s -buffering line
    fileevent $s readable "Admin_Client_Handle $s"
    return $s
}

proc Admin_Client_Handle {cid} {
	global main-loop

    if {[gets $cid request] < 0} {
        close $cid
        # Kludge: for testing only!!!
        exit 0
    } else {
        # Custom code to handle request.
        #
		set response ""
        set rc [handle_launcher_rqst $request response]
		if {$rc == 0} {
			close $cid
			set main-loop 1
			return
		}
	    puts $cid $response
	    flush $cid
		return	
    }
}

# A sample client session looks like this
#   set s [Echo_Client localhost 2540]
#   puts $s "Hello!"
#   gets $s line

#-------------------------------------------------------------------
proc process_tx {key} {
    global g_coroutines
    yield "WAIT_START"    

    while {1} {
        set response ""
        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_peek_wrapper $key [key_mgr_get_msg $key]]
            if {$rc == 0} {
                break
            }
            set response [yield "WAIT_MEM"] 
        }
        set bcd_msg [key_mgr_bcd_get $key]

        set idx [array names g_coroutines $key-*]
        set sd [lindex [split $idx "-"] end]
        #puts "Tx: $bcd_msg"
        puts $sd $bcd_msg
        set rc 1 
        while {$rc != 0} {
            set response [yield "WAIT_SOCK"]
            #puts "Rx: $response"
            if {$response != $bcd_msg} {
                puts "Invalid response: $response"
            } else {
                set rc 0
            }
        }
        if {[sv_csr_read_wrapper $key [key_mgr_get_msg $key]]} {
            puts "ERR: pop failure"
            while {1} {} 
        }
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

proc handle_init {} {
	global g_argdata
	global g_coroutines

	set keydata $g_argdata(IN-1)
	set tokens [split $keydata ":"]
	set key [lindex $tokens 1]
	set size [lindex $tokens 3]
	set len [lindex $tokens 2]

	set keydata $g_argdata(TX_DATA)
	set tokens [split $keydata ":"]
	set from_ipaddr [lindex $tokens 0]
	set from_port [lindex $tokens 1]
	set to_ipaddr [lindex $tokens 2]
	set to_port [lindex $tokens 3]

	set id $g_argdata(GRAPH_ID)

	key_mgr_add $key $size
	stub_init $key $len $size
	set sd [Echo_Client $to_ipaddr $to_port]
	puts $sd "$id $key"
	gets $sd rc
	if {$rc != "$id $key OK"} {
    	puts "$key mismatches $rc"
	}
	Echo_Client_Config $sd 
	coroutine $key-$sd process_tx $key
	set g_coroutines($key-$sd) "WAIT_MEM" 

	return
}

load $env(TCLSHAREDMEM)/tclsharedmem[info sharedlibextension] tclsharedmem 
queue_init
key_mgr_init

# argument data looks like this:
# tclsh node_socif.tcl BLOCK s0:source0 BLOCK <nodename> INIT localhost:8000 GRAPH_ID <id> IN-1 <msg type>:<key>:<size>:<len> TX_DATA <from-ipaddr>:<from-port>:<to-ipaddr>:<to-port>
#
array set g_argdata $argv 
array set g_coroutines {}

set initport [lindex [split $g_argdata(INIT) ":"] 1]
set initaddr [lindex [split $g_argdata(INIT) ":"] 0]
set init_sd [Admin_Client $initaddr $initport]
set g_name $g_argdata(BLOCK)
set g_running 0 

after idle checkagain

vwait main-loop 

exit
