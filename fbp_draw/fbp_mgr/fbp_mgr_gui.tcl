source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(DISK2)/fbp_draw/fbp_mgr/fbp_agent_fsm.tcl
source $env(DISK2)/fbp_draw/fbp_mgr/fbp_mgr.tcl

namespace eval FbpDraw {

variable m_fd

proc fd_to_ipname {cid} {
    variable m_fd

    foreach ipname [array names m_fd] {
	if {$m_fd($ipname) == $cid} {
	    return $ipname
	}
    }
    return ""	
}

proc fbpmgr_handle {cid} {
    variable m_fd
    variable m_graph

    if {[gets $cid request] < 0} {
        close $cid
    } else {
		puts "Rx: $request"
		if {[string first "OK" $request] == -1} {
	    	return
		}
		set tmpdata(ipaddr) [fd_to_ipname $cid]
		if {$tmpdata(ipaddr) == ""} {
	    	return
		}
		Fsm::Run fbp_agent_fsm tmpdata
		set cmd [fbp_agent_fsm::get_clr_cmd]
		if {$cmd != ""} {
	    	set cmd [lappend cmd $m_graph(graph_id)]
    	    foreach ipname [array names m_fd] {
				puts $m_fd($ipname) $cmd
				flush $m_fd($ipname)
	        	puts "Tx: $ipname $cmd"
    	    }
		}
    }
}

proc Mgr_Init {} {
    variable m_fd

    array set m_fd {}
    FbpMgr::Init
    return
}

proc Mgr_Sweep {ipaddrlist} {
    variable m_fd

    # Close preivous file descriptors first.
    foreach ipname [array names m_fd] {
		catch {close $m_fd($ipname)}
		unset m_fd($ipname)
    }	
    FbpMgr::Sweep $ipaddrlist
    return
}

proc Mgr_Run {id nodefile linkfile ipnamelist} {
    variable m_fd
    variable m_network
    variable m_graph

    # Close preivous file descriptors first.
    foreach ipname [array names m_fd] {
		catch {close $m_fd($ipname)}
		unset m_fd($ipname)
    }
	
    # FbpMgr already has list of ip addresses from previous sweep.
    set rc [FbpMgr::bcast_send_file $nodefile $ipnamelist $m_network(fcopy_port)]
    if {$rc != ""} {
		return -code error $rc
    }
    # Download the current link file to fbp agent.
    set rc [FbpMgr::bcast_send_file $linkfile $ipnamelist $m_network(fcopy_port)]
    if {$rc != ""} {
		return -code error $rc
    }

    foreach ipname $ipnamelist {
		set ipaddr [lindex [FbpMgr::get_ipaddr $ipname] 0]
		if {$ipaddr == ""} {
			puts "FbpDraw: $ipname has no ipaddr!"
			continue	
		}
    	set m_fd($ipname) [socket $ipaddr $m_network(service_port)]
    	fileevent $m_fd($ipname) readable "FbpDraw::fbpmgr_handle $m_fd($ipname)"
    	fconfigure $m_fd($ipname) -buffering line -blocking 0 
    }

    set idx [string last "/" $nodefile]
    incr idx
    set filename [string range $nodefile $idx end]
    set idx [string last "/" $linkfile]
    incr idx
    set graphname [string range $linkfile $idx end]

	set tmpdata(id) $id
    set tmpdata(ipaddrlist) $ipnamelist 
    set tmpdata(filename) $filename
    set tmpdata(graphname) $graphname
    set tmpdata(reconnect) 0
    Fsm::Run fbp_agent_fsm tmpdata
    set cmd [fbp_agent_fsm::get_clr_cmd]
    if {$cmd != ""} {
    	foreach ipname $ipnamelist {
	    	puts $m_fd($ipname) $cmd
	    	flush $m_fd($ipname)
            puts "send $ipname $cmd"
    	}
    }
    unset tmpdata
}

proc mgr_terminate {action} {
    variable m_fd
    variable m_graph

    set tmpdata(action) $action 
    Fsm::Run fbp_agent_fsm tmpdata
    set cmd [fbp_agent_fsm::get_clr_cmd]
    if {$cmd != ""} {
	set cmd [lappend cmd $m_graph(graph_id)]
    	foreach ipname [array names m_fd] {
			puts $m_fd($ipname) $cmd
			flush $m_fd($ipname)
            puts "send $ipname $cmd"
    	}
    }
    unset tmpdata
}

proc Mgr_Disconnect {} {
    mgr_terminate "disconnect"
    return
}

proc Mgr_Reconnect {ipnamelist} {
    variable m_fd
    variable m_network
    variable m_graph

    # Close preivous file descriptors first.
    foreach ipname [array names m_fd] {
		catch {close $m_fd($ipname)}
		unset m_fd($ipname)
    }
	
    foreach ipname $ipnamelist { 
		set ipaddr [lindex [FbpMgr::get_ipaddr $ipname] 0]
    	set m_fd($ipname) [socket $ipaddr $m_network(service_port)]
    	fileevent $m_fd($ipname) readable "FbpDraw::fbpmgr_handle $m_fd($ipname)"
    	fconfigure $m_fd($ipname) -buffering line -blocking 0 
    }

    set tmpdata(ipaddrlist) $ipnamelist 
    set tmpdata(filename) "-----" 
    set tmpdata(graphname) $m_graph(graph_id)
    set tmpdata(reconnect) 1
    Fsm::Run fbp_agent_fsm tmpdata
    set cmd [fbp_agent_fsm::get_clr_cmd]
    if {$cmd != ""} {
		set cmd [lappend cmd $m_graph(graph_id)]
    	foreach ipname $ipnamelist {
	    	puts $m_fd($ipname) $cmd
	    	flush $m_fd($ipname)
            puts "send $ipname $cmd"
    	}
    }
    unset tmpdata
}

proc Mgr_Stop {} {
    mgr_terminate "stop"
    return
}

proc Mgr_Query {query} {
    variable m_fd
    variable m_network
    variable m_graph

    set rc ""
    set query [lappend query $m_graph(graph_id)]
    foreach ipname [array names m_fd] { 
		set ipaddr [lindex [FbpMgr::get_ipaddr $ipname] 0]
    	set fd [socket $ipaddr $m_network(info_port)]
		puts $fd $query
		flush $fd
		gets $fd response
		close $fd
		set rc [concat $rc $response]
    }
    return $rc
}

proc Mgr_Query_Graph {query ipname graph_id} {
    variable m_network

    lappend query $graph_id
	set ipaddr [lindex [FbpMgr::get_ipaddr $ipname] 0]
    set fd [socket $ipaddr $m_network(info_port)]
    puts $fd $query
    flush $fd
    gets $fd response
    # Kludge: I have problem retrieving the newline 
    # characters since the get command already removes them!
    # I tried the read command but it does not return.
    # So I have to manually insert the newline character back
    # into the discovered graph file data.
    set data $response
    while {![info complete $data]} {
        append data "\n"
    	gets $fd response
    	append data $response
    }
    set response $data
    close $fd
    return $response
}

}

malloc::init
Fsm::Init
Fsm::Load_Fsm $env(DISK2)/fbp_draw/fbp_mgr/fbp_agent_fsm.dat
Fsm::Init_Fsm fbp_agent_fsm
