namespace eval %%% {

	variable m_cids
	variable m_node_cid_map

	# For cmd sync. Support 1 fbp mgr only.
	variable m_max_cids
	variable m_cid_set
	variable m_cur_cmd
	variable m_fbp_mgr_cid

proc Init {fbp_mgr_cid} {
	variable m_cids
	variable m_node_cid_map
	variable m_max_cids
	variable m_cid_set
	variable m_cur_cmd
	variable m_fbp_mgr_cid

	set m_cids ""
	array set m_node_cid_map {}
	set m_max_cids 0 
	set m_cid_set ""
	set m_cur_cmd ""
	set m_fbp_mgr_cid $fbp_mgr_cid 
	return
}

# For cmd sync
proc Cmd_set {cmd} {
	variable m_cur_cmd

	if {$m_cur_cmd != ""} {
		if {$m_cur_cmd == $m_cur_cmd} {
			return "CMD_SAME"
		} else {
			return "CMD_IN_PROGRESS"
		}
	}
	set m_cur_cmd $cmd
	return "CMD_OK"
}

proc Cmd_get {} {
	variable m_cur_cmd

	return $m_cur_cmd
}

proc Cmd_clr {} {
	variable m_cur_cmd

	set m_cur_cmd "" 
	return
}

proc Handle_Fbp_Mgr {cid request} {
	variable m_cids
	variable m_node_cid_map
	variable m_cid_set
	variable m_cur_cmd

	set cmd [lindex $request 1]
	if {[Cmd_set $cmd] == "CMD_OK"} {
		set m_cid_set $m_cids
		foreach to_cid $m_cids {
			puts $to_cid $cmd
			flush $to_cid 	
		}
	} else {

	}
	return	
}

proc Get_Fbp_Mgr_Cid {} {
	variable m_fbp_mgr_cid

	return $m_fbp_mgr_cid
}

# End for cmd sync

proc Add_cid {cid} {
	variable m_cids
	variable m_max_cids
	variable m_fbp_mgr_cid

	lappend m_cids $cid
	if {[llength $m_cids] == $m_max_cids} {
		puts $m_fbp_mgr_cid "CREATE OK"
		flush $m_fbp_mgr_cid
	}
	#puts $cid "IDENT"
	#flush $cid
    return
}

proc Length_cid {} {
	variable m_cids

    return [llength $m_cids]
}

proc Remove_cid {cid} {
	variable m_cids

	set idx [lsearch $m_cids $cid]
	if {$idx != -1} {
		set m_cids [lreplace $m_cids $idx $idx]
	}
	return $idx
}

proc Handle_cid {cid request} {
	variable m_node_cid_map
	variable m_cid_set
	variable m_fbp_mgr_cid

	set cmd [lindex $request 0]
	set data [lindex $request 1]

	if {$cmd == "IDENT"} {
		# Set up node to cid mapping
		Update_Fsm [Get_Fsm_Id $data] $cid
	} 
	if {$cmd == "TESTEND" || $cmd == "TESTFAIL"} {
		puts $m_fbp_mgr_cid "$cmd"
		flush $m_fbp_mgr_cid
	} else {
		array set arg_array {}
		set arg_array(cid) $cid
		set arg_array(cmd) $cmd
		set arg_array(data) $data
		Fsm::Run [Find_Fsm $cid] arg_array
		# For cmd sync
		set idx [lsearch $m_cid_set $cid]
		if {$idx != -1} {
			set m_cid_set [lreplace $m_cid_set $idx $idx]
			if {$m_cid_set == ""} {
				Cmd_clr
				puts $m_fbp_mgr_cid "$cmd OK"
				flush $m_fbp_mgr_cid
			}
		}
	}
	return
}

proc Setup {id nodefile linkfile fsm_obj_file templatefile} {
	variable m_max_cids
	global env
	set keys ""

	set fd [open $nodefile r]
	while {[gets $fd line] > -1} {
    	set nodename [lindex $line 0]
    	set compfile [subst [lindex $line 1]]
    	set compname [Blk_helper::Parse $compfile]
    	Blk_helper::Add_node $id $nodename $compname

		# Create Fsm object for each node.
		Create_Fsm [Get_Fsm_Id $nodename] $fsm_obj_file $templatefile

		incr m_max_cids
	}
	close $fd

	set fd [open $linkfile r]
	while {[gets $fd line] > -1} {
    	set fromname [lindex $line 0]
    	set toname [lindex $line 2]
    	set fromport [lindex $line 1]
    	set toport [lindex $line 3]
    	set fifo_len [lindex $line 4]

    	set frommsgname [Blk_helper::Get_port_msgdef $id $fromname 0 $fromport]
    	set tomsgname [Blk_helper::Get_port_msgdef $id $toname 1 $toport]
    	if {$frommsgname != $tomsgname} {
        	puts "$line not professed for incompatible msgdef $frommsgname vs $tomsgname"
        	continue
    	}

    	set msgname [Msgdef::Parse $tomsgname]
    	set size [Msgdef::Get_Max_Size $msgname]

    	set key [Key_helper::Create_key $id $line]
    	Blk_helper::Add_fifo_len $id $fromname 0 $fromport $key $fifo_len $size
    	Blk_helper::Add_fifo_len $id $toname 1 $toport $key $fifo_len $size
    	lappend keys $key
	}
	close $fd

	# Allocate the sharedmem with the key reference.
	foreach token [Blk_helper::Get_keys $id] {
    	set key [lindex $token 0]
    	set len [lindex $token 1]
    	set size [lindex $token 2]

    	stub_init $key $len $size 
    	stub_clear $key $len $size
	}
}

proc Execute {id alloc_port} {
	global env

	foreach node [Blk_helper::Get_nodes $id] {
    	set cmd "exec tclsh $env(DISK2)/sharedmem/tcl/node/node.tcl BLOCK $node INIT localhost:$alloc_port "
    	append cmd [Blk_helper::Gen_str $node]
    	append cmd " RUNNING 0 &"
    	eval $cmd
	}
}

proc Cleanup {id} {
	foreach key [Key_helper::Get_all_keys $id] {
		stub_cleanup $key
	}
	return
}

proc Create_Fsm {fsm_obj_id fsm_obj_file templatefile} {
    global env
	variable m_node_cid_map

	set fd [open $templatefile r]
	set template [read $fd]
	close $fd

	regsub "OBJNAME_FSM" $template $fsm_obj_id template
	if {[catch {eval $template} rc]} {
		puts $rc
	}
	set m_node_cid_map($fsm_obj_id) ""	

	Fsm::Load_Fsm_Object $fsm_obj_file $fsm_obj_id
	Fsm::Init_Fsm $fsm_obj_id
    return
}

proc Update_Fsm {fsm_obj_id cid} {
	variable m_node_cid_map

	foreach idx [array names m_node_cid_map] {
		if {$idx == $fsm_obj_id} {
			set m_node_cid_map($fsm_obj_id) $cid
			return 1
		}
	}
	return 0
}

proc Find_Fsm {cid} {
	variable m_node_cid_map

	foreach idx [array names m_node_cid_map] {
		if {$m_node_cid_map($idx) == $cid} {
			return $idx
		}
	}
	return "" 
}

proc Get_Fsm_Id {nodename} {
	set node_prefix [namespace current]
	# Need to keep the :: in node_prefix so that the generated nodename
	# is also a global namespace name
	return $node_prefix-$nodename
}

}
