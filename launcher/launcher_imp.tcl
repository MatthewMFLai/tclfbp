namespace eval %%% {

variable m_initportmap
variable m_blockmap
variable m_connector_port

proc sanity {} {
    return "alive"
}

proc get_port {token} {
    return [lindex [split $token ":"] 1]
}

proc get_ipaddr {token} {
    return [lindex [split $token ":"] 0]
}

proc set_block_port {taskfile ipaddr} {
    variable m_blockmap

    # Clean the block name to mtc socket port map.
    unset m_blockmap
    array set m_blockmap {}
    # Parse the split file to generate the block name to 
    # maintenance socket port mapping array.
    set fd [open $taskfile r]
    while {[gets $fd line] > -1} {
    	array set tmparray $line 
	if {$ipaddr != [get_ipaddr $tmparray(INIT)]} {
	    unset tmparray 
	    continue
	}
	set mtcport [get_port $tmparray(INIT)]
	set block $tmparray(BLOCK)
	# For now just remove the circuit name prefix.
	if {$block != "CONNECT"} {
	    set block [lindex [split $block ":"] 1]
	}
	set m_blockmap($block\-$mtcport) 1
	unset tmparray
    }
    close $fd
    return
}

proc get_block_port {block} {
    variable m_blockmap

    set idx [array names m_blockmap $block\-*]
    return [lindex [split $idx "-"] 1] 
}

proc get_block {blockport} {
    variable m_blockmap

    set idx [array names m_blockmap *-$blockport]
    return [lindex [split $idx "-"] 0] 
}

proc Set_Block_Pid {} {
    variable m_initportmap
    variable m_blockmap

    foreach idx [array names m_blockmap] {
	set token [split $idx "-"]
	set port [lindex $token 1]

	set fd $m_initportmap($port)
	puts $fd "PID"
	flush $fd
	gets $fd pidstr
	set m_blockmap($idx) $pidstr
    }
    return
}

proc get_block_pid {processid} {
    variable m_blockmap

    foreach idx [array names m_blockmap] {
	if {$m_blockmap($idx) == $processid} {
	    set token [split $idx "-"]
	    set block [lindex $token 0]
	    return $block
	}
    }
    return ""
}

proc getCPUutil {idlist} {
    set tmppids [join $idlist ","]
    set rc [exec top -b -n 1 -p $tmppids]
    return $rc
}

proc Queue_data_set {block port length} {
    return "$block:$port:$length"
}

proc Queue_data_get {data p_block p_port p_length} {
    upvar $p_block block
    upvar $p_port port
    upvar $p_length length 

    set tmplist [split $data ":"]
    set block [lindex $tmplist 0]
    set port [lindex $tmplist 1]
    set length [lindex $tmplist 2]
    return 
}

proc Init {graphname} {
    variable m_initportmap
    variable m_blockmap
    variable m_connector_port
    # Content of the current graph file.
    variable m_graph

    if {[info exists m_initportmap]} {
	unset m_initportmap
    }
    array set m_initportmap {}

    if {[info exists m_blockmap]} {
	unset m_blockmap 
    }
    array set m_blockmap {}

    set m_connector_port 0

    set fd [open $graphname r]
    set m_graph [read $fd]
    close $fd
    file delete -force $graphname

    return
}

proc exec_imp {program task} {
    global env
    global tcl_platform
    # Need to check for windows or Unix.
    # tcl_platform(os)
    if {[string first "Windows" $tcl_platform(os)] > -1} {
    	#set line "exec tclsh $env(LAUNCHER_HOME)/$program $task &"
    	set line "exec tclsh $env(LAUNCHER_HOME)/$program "
	foreach {name value} $task {
	    append line "$name "
	    if {[llength $value] == 1} {
	    	append line "$value "
    	    } else {
	    	append line "\{$value\} "
    	    }
	}
	append line "&" 
	#puts "line = $line"
    	set rc [eval $line]
    } else {
    	set rc [exec $env(LAUNCHER_HOME)/$program $task &]
    }
    return $rc
}

proc Runit_Create {taskfile ipaddr p_program_data p_program_testdata} {
    variable m_connector_port
    global env
    upvar $p_program_data program_data
    upvar $p_program_testdata program_testdata

    set_block_port $taskfile $ipaddr
    array set program_data {}
    array set program_testdata {}
    set initportlist ""
    set fd [open $taskfile r]
    while {[gets $fd task] > -1} {
	# Replace all env(..) in line with the corresponding env var value.
	set task [subst $task]
	array set temptable $task
	if {$ipaddr != [get_ipaddr $temptable(INIT)]} {
	    unset temptable
	    continue
	}
	puts "process $task"
	set mtcport [get_port $temptable(INIT)]
	if {[info exists temptable(DATA)]} {
	    set program_data($mtcport) $temptable(DATA)
	} else {
	    set program_data($mtcport) "" 
	}

	if {[info exists temptable(TESTDATA)]} {
	    set program_testdata($mtcport) $temptable(TESTDATA)
	} else {
	    set program_testdata($mtcport) ""
	}

	# Spawn each task as subprocess. The IN-ports for
	# the task will be set up when the subprocess is
	# launched.
	if {[info exists temptable(TYPE)] == 0} {
	    set rc [exec_imp rqstmgr $task]
	} else {
	    if {$temptable(TYPE) == "TX"} {
		set rc [exec_imp txmgr $task]
	    } elseif {$temptable(TYPE) == "TX_OUTONLY"} {
		set rc [exec_imp txmgr_outonly $task]
	    } elseif {$temptable(TYPE) == "RX"} {
		set rc [exec_imp rxmgr $task]
	    } elseif {$temptable(TYPE) == "LDMGR"} {
		set rc [exec_imp loadmgr $task]
	    } else {
		set rc [exec_imp rqstmgr $task]
	    }
	}
	lappend initportlist $mtcport
	check_ready_file $mtcport
	# Mark the init port for the connector component.
	if {$temptable(BLOCK) == "CONNECT"} {
	    set m_connector_port $mtcport
	}
	unset temptable
    }
    close $fd
    return $initportlist
}

proc Runit_Enable {initportlist p_program_data} {
    variable m_initportmap
    upvar $p_program_data program_data

    # Now initialize each task to open the socket connection for the
    # OUT-* ports.
    foreach initport $initportlist {
	set fd [socket localhost $initport]
	fconfigure $fd -buffering line
	if {$program_data($initport) == ""} {
	    puts $fd "ENABLE"
	} else {
	    puts $fd "ENABLE $program_data($initport)"
	}
	set m_initportmap($initport) $fd
	check_ready_file $initport
    }
    return
}

proc Runit_Kick {p_program_testdata} { 
    variable m_initportmap
    upvar $p_program_testdata program_testdata

    foreach initport [array names m_initportmap] {
	if {$program_testdata($initport) == ""} {
	    continue
	}
	set fd $m_initportmap($initport)
	puts $fd "TEST $program_testdata($initport)"
    }
}

proc Runit {taskfile} {
    array set program_data {}
    array set program_testdata {}
    set initportlist [Runit_Create $taskfile abc program_data program_testdata]

    Runit_Enable $initportlist program_data

    # Query the process id for each spawned process.
    Set_Block_Pid

    Runit_Kick program_testdata
    return 
}

proc Drainit {} {
    variable m_connector_port
    variable m_initportmap

    set portlist [array names m_initportmap]
    # Arrange to have the connector port at the head of the list.
    # By doing so we guarantee all the TX components will 
    # always get an ACK when sending out IPs.
    set idx [lsearch $portlist $m_connector_port]
    set portlist [lreplace $portlist $idx $idx]
    set portlist [concat $m_connector_port $portlist]
    foreach initport $portlist {
	set fd $m_initportmap($initport)
	puts $fd "DRAIN"
	check_ready_file $initport
    }
    return
}

proc Stopit_outport {} {
    variable m_initportmap

    # close the OUT-* port for each task.
    foreach initport [array names m_initportmap] {
	set fd $m_initportmap($initport)
	puts $fd "DISABLE"
	check_ready_file $initport
    }
    return
}

proc Stopit_initport {} {
    variable m_initportmap

    # close the init port to each task. This will translate to
    # task terminte later on.
    foreach initport [array names m_initportmap] {
	set fd $m_initportmap($initport)
	close $fd
    }
    return
}

proc Stopit {} {
    Stopit_outport
    Stopit_initport
}

proc QueryQueue {} {
    variable m_initportmap
    variable m_blockmap

    set fd $m_initportmap([get_block_port CONNECT])
    puts $fd "QUEUEQUERY"
    flush $fd
    gets $fd line
    array set tmpdata $line
    set rc ""
    foreach idx [array names tmpdata] {
	# idx looks like INPORT-1-8013
	if {$tmpdata($idx) == 0} {
	    continue
	}
	set token [split $idx "-"]
	set portname [lindex $token 1]
	set blockport [lindex $token 2]
	set block [get_block $blockport]
	lappend rc "$block $portname $tmpdata($idx)"
    }
    return $rc
}

proc QueryCpu {} {
    variable m_blockmap
    global tcl_platform

    # Per process cpu utilization.
    set idlist "" 
    foreach idx [array names m_blockmap] {
	lappend idlist $m_blockmap($idx)
    }
    if {[string first "Windows" $tcl_platform(os)] > -1} {
	set rc ""
	foreach idx [array names m_blockmap] {
	    set token [split $idx "-"]
	    set block [lindex $token 0]
	    append rc "$block N/A "
	}
    } else {
    	set data [split  [getCPUutil $idlist] "\n"]
	foreach line $data {
	    if {$line == ""} {
		continue
	    }
	    set block [get_block_pid [string trim [lindex $line 0]]]
	    if {$block != ""} {
		append rc "$block [string trim [lindex $line 8]] "
	    }
	}
    }
    return [string range $rc 0 end-1] 
}

proc QueryGraph {} {
    variable m_graph

    return [list $m_graph]
}

proc check_ready_file {initport} {
    # Check for the presence of marker file before 
    # launching another task.
    set toloop 1
    while {$toloop} {
    	if {[file exists data_$initport.ready]} {
	    set toloop 0
	    file delete data_$initport.ready
	}
    	after 50
    }
}

}
