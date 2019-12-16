source $env(DISK2)/fbp_draw/fbp_mgr/fbp_mgr_gui.tcl

namespace eval FbpDraw {
    variable m_tmpdir
    variable m_querytime
    variable m_runstate
    variable m_queryid
    variable m_portqueuelist
    variable m_cpus
	variable m_ipaddrlist

proc launch_init {cfgfiles} {
    variable m_tmpdir
    variable m_querytime
    variable m_queryid
    variable m_runstate
    variable m_portqueuelist
    variable m_cpus
	variable m_ipaddrlist
    global env

    set m_tmpdir $env(DISK2)/scratchpad/tmp
    array set m_querytime {QUEUE 0 CPU 0} 
    array set m_queryid {QUEUE 0 CPU 0} 
    set m_runstate "LAUNCH_IDLE"
    set m_portqueuelist ""
    set m_cpus ""
	set m_ipaddrlist ""

	foreach cfgfile $cfgfiles {
		Cfg::Init $cfgfile
		set rc [Cfg::Get_Ip]
		# idx 0 = virtual name
		# idx 1 = ip address
		# idx 2 = port number
		lappend m_ipaddrlist "[lindex $rc 1] [lindex $rc 2]"
	} 
    return
}

proc launch_clear_cpu {win} {
    variable m_cpus

    array set tmparray $m_cpus
    foreach idx [array names tmparray] {
        set tmparray($idx) "CLEAR"
    }
    update_cpu $win tmparray
    set m_cpus ""	
    return
}

proc launch_setdir {} {
    variable m_tmpdir
    variable m_runstate

    if {$m_runstate != "LAUNCH_IDLE"} {
	error_dialog "Network is running!"
	return
    }

    set m_tmpdir [tk_chooseDirectory \
        -initialdir ~ -title "Choose a working directory"]
    if {$m_tmpdir == ""} {
	error_dialog "Working directory is not set!"
	return
    }
    set m_tmpdir "$m_tmpdir/FBPDRAW"
    if {[file exists $m_tmpdir]} {
    	file delete -force $m_tmpdir
    }
    file mkdir $m_tmpdir
    return
}

proc launch_run {p_blockname_map} {
    variable m_tmpdir
    variable m_runstate
    variable m_network
    variable m_graph
    global env
    global tcl_platform

    if {$m_graph(graph_id) == ""} {
	error_dialog "Graph name cannot be empty!"
	return
    }
    if {$m_runstate != "LAUNCH_IDLE"} {
	error_dialog "Network is already running!"
	return
    }
	
    if {$m_tmpdir == ""} {
	error_dialog "Select scratchpad to set working directory!"
	return
    }

    # Call the routines to generate block and link files.
    set name "$m_tmpdir/$m_graph(graph_id)"
    upvar $p_blockname_map blockname_map
    gen_block_file $name.node  blockname_map
    gen_link_file $name.link blockname_map

	if {0} {
    # Call the fbp routines to generate the out and split files.
    if {[string first "Windows" $tcl_platform(os)] > -1} {
    	set line "exec tclsh $env(FBP_HOME)/fbp_test.tcl "
        append line "$name.block $name.link $m_network(circuitname) $m_network(first_port) $name.out"
	eval $line
    	set line "exec tclsh $env(FBP_HOME)/fbp_postproc.tcl "
	append line "$name.out $name.split"
	eval $line
    } else {
    	exec $env(FBP_HOME)/fbp_test.tcl \
            $name.block $name.link $m_network(circuitname) $m_network(first_port) $name.out
    	exec $env(FBP_HOME)/fbp_postproc.tcl $name.out $name.split 
    }
	}

    # Call FBP mgr to spawn the processes.
    set ipaddrlist [block_get_all_ipaddr]
    set graphfile [Gen_Graphfile_Name]
    if {[catch {Mgr_Run $m_graph(graph_id) $name.node $name.link $ipaddrlist} rc]} {
		puts $rc
		return
    }
    set m_runstate "LAUNCH_RUNNING"
    file delete -force $name.block
    file delete -force $name.link
    #file delete -force $name.out
    file delete -force $name.split
    file delete -force $graphfile
    return
}

proc launch_stop_trace {win} {
    variable m_querytime
    variable m_queryid
    variable m_portqueuelist

    if {$m_querytime(QUEUE) != 0} {
	set m_querytime(QUEUE) 0
	after cancel $m_queryid(QUEUE)
	set m_queryid(QUEUE) 0
	update_port_queue $win $m_portqueuelist
	set m_portqueuelist ""
    }
    if {$m_querytime(CPU) != 0} {
	set m_querytime(CPU) 0
	after cancel $m_queryid(CPU)
	set m_queryid(CPU) 0
	launch_clear_cpu $win
    }
    return
}

proc launch_disconnect {win} {
    variable m_runstate

    if {$m_runstate != "LAUNCH_RUNNING"} {
	error_dialog "Network is not running!"
	return
    }
    launch_stop_trace $win
    if {[catch {Mgr_Disconnect} rc]} {
	
    }
    set m_runstate "LAUNCH_IDLE"
    return
}

proc launch_stop {win} {
    variable m_runstate

    if {$m_runstate != "LAUNCH_RUNNING"} {
	error_dialog "Network is not running!"
	return
    }
    launch_stop_trace $win
    if {[catch {Mgr_Stop} rc]} {
	
    }
    set m_runstate "LAUNCH_IDLE"
    return
}

proc launch_monitor {win} {
    variable m_runstate
    variable m_querytime
    variable m_queryid
    variable m_portqueuelist

    if {$m_runstate != "LAUNCH_RUNNING"} {
	error_dialog "Network is not running!"
	return
    }

    if {$m_querytime(QUEUE) == 0} {
	set m_querytime(QUEUE) 100
	set m_queryid(QUEUE) [after $m_querytime(QUEUE) FbpDraw::query_queue $win]
    } else {
	set m_querytime(QUEUE) 0
	after cancel $m_queryid(QUEUE)
	set m_queryid(QUEUE) 0
	update_port_queue $win $m_portqueuelist
	set m_portqueuelist ""
    }
    return 
}

proc launch_monitor_cpu {win} {
    variable m_runstate
    variable m_querytime
    variable m_queryid

    if {$m_runstate != "LAUNCH_RUNNING"} {
	error_dialog "Network is not running!"
	return
    }

    if {$m_querytime(CPU) == 0} {
	set m_querytime(CPU) 1500
	set m_queryid(CPU) [after $m_querytime(CPU) FbpDraw::query_cpu $win]
    } else {
	set m_querytime(CPU) 0
	after cancel $m_queryid(CPU)
	set m_queryid(CPU) 0
	launch_clear_cpu $win
    }
    return 
}
proc query_queue {win} {
    variable m_querytime
    variable m_queryid
    variable m_portqueuelist

    set rc [Mgr_Query QUERY_QUEUE]
    if {$rc != ""} {
	update_port_queue $win $m_portqueuelist
	set m_portqueuelist ""
	update_port_queue $win $rc
	foreach token $rc {
	    queue_data_get $token block port length
	    set length 0
	    lappend m_portqueuelist \
                [queue_data_set $block $port $length]
	}
    } else {
	if {$m_portqueuelist != ""} {
	    update_port_queue $win $m_portqueuelist
	    set m_portqueuelist ""
	}
    }

    if {$m_querytime(QUEUE) != 0} {
    	set m_queryid(QUEUE) [after $m_querytime(QUEUE) FbpDraw::query_queue $win]
    }
    return
}

proc query_cpu {win} {
    variable m_querytime
    variable m_queryid
    variable m_cpus

    set rc [Mgr_Query QUERY_CPU]
    if {$rc != ""} {
	# Clear old data first.
	launch_clear_cpu $win

	set m_cpus $rc
	array set tmparray $rc
	update_cpu $win tmparray 
    }

    if {$m_querytime(CPU) != 0} {
    	set m_queryid(CPU) [after $m_querytime(CPU) FbpDraw::query_cpu $win]
    }
    return
}

proc launch_reconnect {win} {
    variable m_tmpdir
    variable m_runstate
    variable m_network
    variable m_graph

    if {$m_graph(graph_id) == ""} {
	error_dialog "Graph name cannot be empty!"
	return
    }
    if {$m_runstate != "LAUNCH_IDLE"} {
	error_dialog "Network is already running!"
	return
    }
	
    if {$m_tmpdir == ""} {
	error_dialog "Select scratchpad to set working directory!"
	return
    }

    # Call FBP mgr to spawn the processes.
    set ipaddrlist [block_get_all_ipaddr]
    if {[catch {Mgr_Reconnect $ipaddrlist} rc]} {
	puts $rc
	return
    }
    set m_runstate "LAUNCH_RUNNING"
    return
}

}
