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

proc Admin_Client {host port} {
    set s [socket $host $port]
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

set initport [lindex [split $argdata(INIT) ":"] 1]
set initaddr [lindex [split $argdata(INIT) ":"] 0]
set init_sd [Admin_Client $initaddr $initport]

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
    puts $sd $key
    gets $sd rc
    if {$key != $rc} {
        puts "$key mismatches $rc"
    }
    Echo_Client_Config $sd 
    coroutine $key-$sd process $key
    set g_coroutines($key-$sd) "WAIT_MEM" 
} 

set g_running 1 

after idle checkagain

vwait main-loop 

exit
