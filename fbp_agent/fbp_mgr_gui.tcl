source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source fbp_agent_fsm.tcl
source fbp_mgr.tcl

proc fd_to_ipaddr {cid} {
    global fd

    foreach ipaddr [array names fd] {
	if {$fd($ipaddr) == $cid} {
	    return $ipaddr
	}
    }
    return ""	
}

proc fbpmgr_handle {cid} {
    global fd

    if {[gets $cid request] < 0} {
        close $cid
    } else {
	puts "Rx: $request"
	if {$request != "DONE"} {
	    return
	}
	set tmpdata(ipaddr) [fd_to_ipaddr $cid]
	if {$tmpdata(ipaddr) == ""} {
	    return
	}
	Fsm::Run fbp_agent_fsm tmpdata
	set cmd [fbp_agent_fsm::get_clr_cmd]
	if {$cmd != ""} {
	    puts "Tx: $cmd"
    	    foreach ipaddr [FbpMgr::getip] {
		puts $fd($ipaddr) $cmd
		flush $fd($ipaddr)
    	    }
	}
    }
}

malloc::init
Fsm::Init
Fsm::Load_Fsm fbp_agent_fsm.dat
Fsm::Init_Fsm fbp_agent_fsm

#set w .fr1
#toplevel $w
set w .fr1
frame $w -borderwidth 1 -relief raised
pack $w -fill x
text $w.text -relief sunken -bd 2
pack $w.text -expand yes -fill both
frame $w.buttons
pack $w.buttons -side bottom -fill x -pady 2m
button $w.buttons.sweep -text Sweep -command {
    FbpMgr::Init 192.168.0 14000
    FbpMgr::Sweep 113 117
    $w.text delete 0.0 end
    $w.text insert end "[FbpMgr::getip]\n" 
}

button $w.buttons.run -text Run -command {
    # FbpMgr already has list of ip addresses from previous sweep.
    FbpMgr::bcast_send_file task.split 14001

    global fd
    array set fd {}
    foreach ipaddr [FbpMgr::getip] { 
    	set fd($ipaddr) [socket $ipaddr 14000]
    	fileevent $fd($ipaddr) readable "fbpmgr_handle $fd($ipaddr)"
    	fconfigure $fd($ipaddr) -buffering line -blocking 0 
    }

    set tmpdata(ipaddrlist) [FbpMgr::getip]
    set tmpdata(filename) "task.split" 
    Fsm::Run fbp_agent_fsm tmpdata
    set cmd [fbp_agent_fsm::get_clr_cmd]
    if {$cmd != ""} {
        $w.text insert end "send $cmd\n"
    	foreach ipaddr [FbpMgr::getip] {
	    puts $fd($ipaddr) $cmd
	    flush $fd($ipaddr)
    	}
    }
    unset tmpdata
}

button $w.buttons.stop -text Stop -command {
    set tmpdata(action) "stop" 
    Fsm::Run fbp_agent_fsm tmpdata
    set cmd [fbp_agent_fsm::get_clr_cmd]
    if {$cmd != ""} {
        $w.text insert end "send $cmd\n"
    	foreach ipaddr [FbpMgr::getip] {
	    puts $fd($ipaddr) $cmd
	    flush $fd($ipaddr)
    	}
    }
    unset tmpdata
}

button $w.buttons.exit -text Exit -command "exit 0"
pack $w.buttons.sweep $w.buttons.run $w.buttons.stop $w.buttons.exit -side left -expand 1
