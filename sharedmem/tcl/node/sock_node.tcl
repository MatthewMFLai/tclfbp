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
    coroutine $key-$sd process_tx $key
    set g_coroutines($key-$sd) "WAIT_MEM" 
} 

set g_running 1 

after idle checkagain

vwait main-loop 

exit