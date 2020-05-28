#------------------------------------------------------------
# Socket interface code section

proc client_init {cid} {
    fileevent $cid readable "client_handle $cid"
    fconfigure $cid -buffering line
}

# api to send message to the launcher (fbp agent). For use with running unit tests. 
# Not to be used by app. 
proc client_send {msg} {
    global g_sd
    puts $g_sd $msg
    return
}

proc client_handle {cid} {
	global main-loop

    if {[gets $cid request] < 0} {
        close $cid
		set main-loop 1
    } else {
        # Custom code to handle initialization.
        #
		set response ""
        set rc [initialize $request response]
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

proc initialize {request p_response} {
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
            set response "INIT [app_init]" 
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
            set response "TEST [app_test]" 
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
# End Socket interface code section
#-------------------------------------------------------------------

proc port_read {port p_msgin} {
    upvar $p_msgin msgin

    Portmgr::Get_Portmsgdef $port msgname
    array set tmpdata {}
   	Msgdef::Get_Attr_Offset $msgname tmpdata
    foreach attr [array names tmpdata] {
       	set msgin($attr) "" 
    }
	
	set shmkey_cur ""
	set msg_complete 0 
	while {!$msg_complete} {

		if {$shmkey_cur == ""} {	
    		Portmgr::Get_Shm $port keylist
		} else {
			set keylist [list $shmkey_cur]
		}
    	set rc 1 
    	while {$rc != 0} {
        	foreach shmkey $keylist {
            	set rc [sv_csr_read_wrapper $shmkey [port_mgr_get_msg $port]]
            	if {$rc == 0} {
					# Large message support: send subsequent fragmented message
					# to the same shmkey used for the 1st message.
					set shmkey_cur $shmkey
                	break
            	}
        	}
        	if {$rc} {
            	yield
        	}
    	}

    	foreach attr [array names tmpdata] {
        	append msgin($attr) [port_mgr_msg_get $port $tmpdata($attr)]
    	}
		# Do not append the sys_msgcomplete attr.
        set msgin(sys_msgcomplete) [port_mgr_msg_get $port $tmpdata(sys_msgcomplete)]
		set msg_complete $msgin(sys_msgcomplete) 
	}
}

proc port_read_once {port p_msgin} {
    upvar $p_msgin msgin

    Portmgr::Get_Portmsgdef $port msgname
    array set tmpdata {}
   	Msgdef::Get_Attr_Offset $msgname tmpdata
    foreach attr [array names tmpdata] {
       	set msgin($attr) "" 
    }
	
	set shmkey_cur ""
	set msg_complete 0 
	while {!$msg_complete} {

		if {$shmkey_cur == ""} {	
    		Portmgr::Get_Shm $port keylist
		} else {
			set keylist [list $shmkey_cur]
		}
    	set rc 1 
    	while {$rc != 0} {
        	foreach shmkey $keylist {
            	set rc [sv_csr_read_wrapper $shmkey [port_mgr_get_msg $port]]
            	if {$rc == 0} {
					# Large message support: send subsequent fragmented message
					# to the same shmkey used for the 1st message.
					set shmkey_cur $shmkey
                	break
            	}
        	}
			if {$shmkey_cur == ""} {
				# Large message support: 1st fragment read on all links fail.
				# Simply return.
				return $rc
			}
        	if {$rc} {
            	yield
        	}
    	}

    	foreach attr [array names tmpdata] {
        	append msgin($attr) [port_mgr_msg_get $port $tmpdata($attr)]
    	}
		# Do not append the sys_msgcomplete attr.
        set msgin(sys_msgcomplete) [port_mgr_msg_get $port $tmpdata(sys_msgcomplete)]
		set msg_complete $msgin(sys_msgcomplete) 
	}

}

proc port_write {port p_msgout} {
    upvar $p_msgout msgout

    Portmgr::Get_Portmsgdef $port msgname
    array set tmpdata {}
    array set sizedata {}
    Msgdef::Get_Attr_Offset $msgname tmpdata
    Msgdef::Get_Attr_Size $msgname sizedata

	# Large message support
	set shmkey_cur ""
	set msg_complete 0 
	while {!$msg_complete} {

		set msg_complete 1 
    	foreach attr [array names tmpdata] {
        	if {![info exists msgout($attr)]} {
            	continue
        	}
			set size [expr $sizedata($attr) - 1]
			if {[string length $msgout($attr)] > $size} {
        		set data [string range $msgout($attr) 0 [expr $size - 1]]
				set msgout($attr) [string range $msgout($attr) $size end]
				set msg_complete 0 
			} else {
        		set data $msgout($attr)
				set msgout($attr) "" 
			}	
        	port_mgr_msg_set $port $data $tmpdata($attr)
    	}
      	port_mgr_msg_set $port $msg_complete $tmpdata(sys_msgcomplete)

		if {$shmkey_cur == ""} {	
    		Portmgr::Get_Shm $port keylist
		} else {
			set keylist [list $shmkey_cur]
		}
    	set rc 1 
    	while {$rc != 0} {
        	foreach shmkey $keylist {
            	set rc [sv_csr_write_wrapper $shmkey [port_mgr_get_msg $port]]
            	if {$rc == 0} {
					# Large message support: send subsequent fragmented message
					# to the same shmkey used for the 1st message.
					set shmkey_cur $shmkey
                	break
            	}
        	}
        	if {$rc} {
            	yield
        	}
    	}
	}
}

proc port_write_once {port p_msgout} {
    upvar $p_msgout msgout

    Portmgr::Get_Portmsgdef $port msgname
    array set tmpdata {}
    array set sizedata {}
    Msgdef::Get_Attr_Offset $msgname tmpdata
    Msgdef::Get_Attr_Size $msgname sizedata

	# Large message support
	set shmkey_cur ""
	set msg_complete 0 
	while {!$msg_complete} {

		set msg_complete 1 
    	foreach attr [array names tmpdata] {
        	if {![info exists msgout($attr)]} {
            	continue
        	}
			set size [expr $sizedata($attr) - 1]
			if {[string length $msgout($attr)] > $size} {
        		set data [string range $msgout($attr) 0 [expr $size - 1]]
				set msgout($attr) [string range $msgout($attr) $size end]
				set msg_complete 0 
			} else {
        		set data $msgout($attr)
				set msgout($attr) "" 
			}	
        	port_mgr_msg_set $port $data $tmpdata($attr)
    	}
      	port_mgr_msg_set $port $msg_complete $tmpdata(sys_msgcomplete)

		if {$shmkey_cur == ""} {	
    		Portmgr::Get_Shm $port keylist
		} else {
			set keylist [list $shmkey_cur]
		}

    	set rc 1
    	while {$rc != 0} {
    		foreach shmkey $keylist {
        		set rc [sv_csr_write_wrapper $shmkey [port_mgr_get_msg $port]]
        		if {$rc == 0} {
					# Large message support: send subsequent fragmented message
					# to the same shmkey used for the 1st message.
					set shmkey_cur $shmkey
            		break
        		}
        		if {$rc} {
            		yield
        		}
    		}
			if {$shmkey_cur == ""} {
				# Large message support: 1st fragment send on all links fail.
				# Simply return.
				break
			}
		}
	}
	return $rc
}

proc port_factory_msg {port p_msgout} {
    upvar $p_msgout msgout
    Portmgr::Get_Portmsgdef $port msgname
    Msgdef::Factory $msgname msgout
    return 
}

#------------------------------------------------------------
# Delayed outport send section

# Callee must be running in Tk code!
# Callee cannot be running in the client's process() routine!
proc port_write_queued {outport p_msgout} {
    upvar $p_msgout msgout
	global g_port_write_queue

	lappend g_port_write_queue [list $outport [array get msgout]]
	return
}

# Callee must be running in the client's process() routine!
proc port_write_dequeued {} {
	global g_port_write_queue

	foreach token $g_port_write_queue {
		set outport [lindex $token 0]
		array set msgout [lindex $token 1]
		port_write $outport msgout
		unset msgout
	}

	set g_port_write_queue ""
	return	
}
#------------------------------------------------------------

proc runit {} {
    yield

    while {1} {
        process
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

source $env(DISK2)/sharedmem/tcl/portmgr/portmgr.tcl
Portmgr::Init
source $env(DISK2)/sharedmem/tcl/msgdef/msgdef.tcl
Msgdef::Init
load $env(TCLSHAREDMEM)/tclsharedmem[info sharedlibextension] tclsharedmem 
queue_init
port_mgr_init

# argument data looks like this:
# tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $MSGDEF_HOME/test/test0.msg:test_tx.tcl:4 OUT-1 $MSGDEF_HOME/test/test0.msg:test_rx.tcl:4 PROGRAM $DISK2/sharedmem/tcl/test2.tcl
#
# Each port data contains the following info pieces
# <port name> <msgdef : sharedmem key : length : sharedmem key : length :...>
array set argdata $argv 

# All ports are prefixed by "IN-" and "OUT-"
foreach porttype "IN OUT" {
    foreach port [array names argdata "$porttype-*"] {
        set tokens [split $argdata($port) ":"]

        set msgfile [lindex $tokens 0]
        set msgname [Msgdef::Parse $msgfile]
        set size [Msgdef::Get_Max_Size $msgname]
        Portmgr::Add $port $porttype $msgname
        port_mgr_add $port $size

        array set tmpdata [lrange $tokens 1 end]  
        foreach shmkey [array names tmpdata] {
            set len $tmpdata($shmkey)
            Portmgr::Add_Shm $port $shmkey $len
            stub_init $shmkey $len $size
        }
        unset tmpdata
    }
} 

set appfile $argdata(PROGRAM)
source $appfile

set g_running $argdata(RUNNING)
set g_name $argdata(BLOCK)
set g_port_write_queue ""
set port [lindex [split $argdata(INIT) ":"] 1]
set g_sd [socket localhost $port]
client_init $g_sd

coroutine checkit runit

after idle checkagain

vwait main-loop 

exit
