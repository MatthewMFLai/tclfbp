namespace eval %%% {

	variable m_cids
	variable m_node_cid_map
	variable m_cfg
	variable m_sock_node_rx_ack

	# For cmd sync. Support 1 fbp mgr only.
	variable m_max_cids
	variable m_cid_set
	variable m_cur_cmd
	variable m_fbp_mgr_cid

proc Init {fbp_mgr_cid} {
	variable m_cids
	variable m_node_cid_map
	variable m_cfg
	variable m_sock_node_rx_ack
	variable m_max_cids
	variable m_cid_set
	variable m_cur_cmd
	variable m_fbp_mgr_cid
	global env

	set cfgfile $env(COMP_HOME)/ut_common/launcher_imp.cfg
	array set m_cfg {}
	source $cfgfile

	set m_sock_node_rx_ack 1
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
	variable m_sock_node_rx_ack

	lappend m_cids $cid
	if {[llength $m_cids] == $m_max_cids && $m_sock_node_rx_ack} {
		puts $m_fbp_mgr_cid "CREATE OK"
		flush $m_fbp_mgr_cid
	}
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

proc Set_sock_node_rx_ack {} {
	variable m_cids
	variable m_max_cids
	variable m_fbp_mgr_cid
	variable m_sock_node_rx_ack

	set m_sock_node_rx_ack 1
	if {[llength $m_cids] == $m_max_cids} {
		puts $m_fbp_mgr_cid "CREATE OK"
		flush $m_fbp_mgr_cid
	}
    return
}

proc Setup {id ip nodefile linkfile fsm_obj_file templatefile} {
	variable m_max_cids
	variable m_cfg
	variable m_sock_node_rx_ack
	global env
	set keys ""

	# A temporary mapping table to map the SOCK_RTX_* to local and remote ip.
	# eg. SOCK_RTX_1 ... ip
	#     SOCK_RTX_1 ... ip2
	# will result in sock_ip_map(SOCK_RTX_1) {ip ip2}
	array set sock_ip_map {}
	
	set fd [open $nodefile r]
	while {[gets $fd line] > -1} {
    	set nodename [lindex $line 0]
    	set compfile [subst [lindex $line 1]]
    	set node_ip [lindex $line 2]
		if {$node_ip == ""} {
			set node_ip $ip
		}
	
		# Populate nodename to ip mapping table	
		# Must perform this step before the check for matching ip below
		# $ip != $node_ip
		if {[string first $m_cfg(sock_str) $nodename] == 0} {
			if {![info exists sock_ip_map($nodename)]} {
				set sock_ip_map($nodename) ""
			}
			lappend sock_ip_map($nodename) $node_ip
		}

		if {$ip != $node_ip} {
			continue
		}
    	set compname [Blk_helper::Parse $compfile]
    	Blk_helper::Add_node $id $nodename $compname

		# sock rx does not need to be created as it exists as a separate daemon.
		if {$compname != $m_cfg(sock_rx)} {
			# Create Fsm object for each node.
			Create_Fsm [Get_Fsm_Id $nodename] $fsm_obj_file $templatefile

			incr m_max_cids
		}
	}
	close $fd

	set fd [open $linkfile r]
	while {[gets $fd line] > -1} {
    	set fromname [lindex $line 0]
    	set toname [lindex $line 2]
    	set fromport [lindex $line 1]
    	set toport [lindex $line 3]
    	set fifo_len [lindex $line 4]

		# Allocate shared memory for the link with both endpoint nodes
		# on the current machine.
		if {![Blk_helper::Find_node $id $fromname] ||
			![Blk_helper::Find_node $id $toname]} {
			continue
		}
 
    	set frommsgname [Blk_helper::Get_port_msgdef $id $fromname 0 $fromport]
    	set tomsgname [Blk_helper::Get_port_msgdef $id $toname 1 $toport]
    	if {$frommsgname != $tomsgname} {
			if {$frommsgname != $m_cfg(msg_null) && $tomsgname != $m_cfg(msg_null)} {
        		puts "$line not checked for incompatible msgdef $frommsgname vs $tomsgname"
				continue
			} else {
				# Process the line as one endpoint can be a sock node.
			}
    	}	

		if {$frommsgname == $m_cfg(msg_null)} {
    		set msgname [Msgdef::Parse $tomsgname]
		} else {
    		set msgname [Msgdef::Parse $frommsgname]
		}
    	set size [Msgdef::Get_Max_Size $msgname]
 
		if {[string first $m_cfg(sock_str) $fromname] == 0} {
    		set key [Key_helper::Create_key $id $fromname]
		} elseif {[string first $m_cfg(sock_str) $toname] == 0} {
    		set key [Key_helper::Create_key $id $tomname]
		} else {
    		set key [Key_helper::Create_key $id $line]
		}
    	Blk_helper::Add_fifo_len $id $fromname 0 $fromport $key $fifo_len $size
    	Blk_helper::Add_fifo_len $id $toname 1 $toport $key $fifo_len $size

		# Update the tx and rx data in Blk_helper for the cross machines link.
		if {[string first $m_cfg(sock_str) $fromname] == 0} {
			Blk_helper::Add_rx_data $id $fromname $key:$size:$fifo_len
			set m_sock_node_rx_ack 0
		}
		if {[string first $m_cfg(sock_str) $toname] == 0} {
			foreach to_ip $sock_ip_map($nodename) {
				if {$to_ip == $ip} {
					continue
				}
				if {![info exists m_cfg($to_ip)] ||
					![info exists m_cfg($to_ip:port)} {
					# Log error?
					continue
				}
				Blk_helper::Add_tx_data $id $toname $m_cfg($to_ip):$m_cfg($to_ip:port)
				break
			}
		}
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

	foreach cmd [Blk_helper::Get_Exec_Cmds $id $alloc_port] {
    	eval $cmd
	}
	# For setting up sock_node_rx with keys
	set keydatalist [Blk_helper::Get_rx_data $id]
	if {$keydatalist != ""} {
		sock_node_rx_send_keys $id $keydatalist
	}
	return
}

proc Cleanup {id} {
	# For setting up sock_node_rx with keys delete
	set keydatalist [Blk_helper::Get_rx_data $id]
	if {$keydatalist != ""} {
		sock_node_rx_send_keys_delete $id $keydatalist
	}

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
