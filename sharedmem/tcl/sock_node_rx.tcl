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

    # Check end of file or abnormal connection drop,
    # then echo data back to the client.

    if {[eof $sock] || [catch {gets $sock key}]} {
	close $sock
    } else {
        puts $sock $key
        # Create coroutine if shared memory key is valid
        coroutine $key-$sock process $key
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

#-------------------------------------------------------------------
proc process {key} {
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
} 

set g_running 1 

after idle checkagain

Echo_Server $to_port
vwait main-loop 

exit
