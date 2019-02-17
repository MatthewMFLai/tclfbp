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
    if {[gets $cid response] < 0} {
        close $cid
    } else {
        # Custom code to handle initialization.
        #
	puts $response
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
proc process {} {

    set bcd_msg [mem_read $key] 
    sock_write $key $bcd_msg 
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
proc mem_read {key} {

    set rc 1 
    while {$rc != 0} {
        set rc [sv_csr_read_wrapper $key [key_mgr_get_msg $key]]
        if {$rc == 0} {
            break
        }
        yield
    }
    return [key_mgr_bcd_get $key]
}

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

proc sock_write {key bcd_msg} {
    global g_coroutines

    set idx [array names g_coroutines $key-*]
    set sd [lindex [split $idx "-"] 1]
    puts $sd $bcd_msg
    set response [yield]
    if {$response != "OK $bcd_msg"} {
        puts "Invalid response: $response"
    }
    return 
}

proc runit {} {
    yield

    set count 10
    while {1} {

        incr count -1
        process $count
        if {$count == 0} {
            set count 10
        }
    }
 
    return
}

proc checkagain {} {
    global g_running

    if {$g_running} {
        checkit
    }
    after 10 checkagain
}

global g_coroutines
array set g_coroutines {}

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem 
queue_init
key_mgr_init

# argument data looks like this:
# tclsh node_socif.tcl BLOCK s0:source0 INIT localhost:8000 KEYS-OUT {<key>:<size>:<len>:<ipaddr>:<port> <key>:<size>:<len>:<ipaddr>:<port> ... } KEYS-IN {<key>:<size>:<len> ... } 
#
array set argdata $argv 

# All keys are suffixed by "IN-" and "OUT-"
foreach keydata $argdata(KEYS-OUT) { 
    set tokens [split $keydata ":"]
    set key [lindex $tokens 0]
    set size [lindex $tokens 1]
    set len [lindex $tokens 2]
    set ipaddr [lindex $tokens 3]
    set port [lindex $tokens 4]

    key_mgr_add $key $size
    stub_init $key $len $size
    set sd [Echo_Client $ipaddr $port]
    coroutine $key-$sd runit
    set g_coroutines($key-$sd) $key-$sd 
} 

set g_running $argdata(RUNNING)

set port [lindex [split $argdata(INIT) ":"] 1]
set sd [socket localhost $port]
client_init $sd

coroutine checkit runit

after idle checkagain

vwait main-loop 

exit
