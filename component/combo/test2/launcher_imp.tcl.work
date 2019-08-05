namespace eval %%% {

	variable m_cids
	variable m_cid_node_map
	variable m_node_state

proc Init {} {
	variable m_cids
	variable m_cid_node_map
	variable m_node_state

	set m_cids ""
	array set m_cid_node_map {}
	array set m_node_state {}
	return
}

proc Add_cid {cid} {
	variable m_cids

	lappend m_cids $cid
	puts $cid "IDENT"
	flush $cid
    return
}

proc Length_cid {} {
	variable m_cids

    return [llength $m_cids]
}

proc Remove_cid {cid} {
	variable m_cids
	variable m_cid_node_map
	variable m_node_state

	set idx [lsearch $m_cids $cid]
	if {$idx != -1} {
		set m_cids [lreplace $m_cids $idx $idx]
	}
	if {[info exists m_cid_node_map($cid)]} {
		set tmpnode $m_cid_node_map($cid)
		unset m_cid_node_map($cid)
		unset m_node_state($tmpnode)
	}
	return
}

proc Handle_cid {cid request} {
	variable m_cids
	variable m_cid_node_map
	variable m_node_state

	set cmd [lindex $request 0]
	set data [lindex $request 1]
	set response ""
	set state ""
	if {[info exists m_cid_node_map($cid)]} {
		set node $m_cid_node_map($cid)
		set state $m_node_state($node)
	}	

	switch -- $cmd \
		IDENT {
			set m_cid_node_map($cid) $data
			set m_node_state($data) INIT
			puts $cid INIT
			flush $cid

	}   INIT {
			if {$state == "INIT"} {
				set m_node_state($node) ENABLE 
				puts $cid ENABLE 
				flush $cid
			}
					
	}   ENABLE {
			if {$state == "ENABLE"} {
				set m_node_state($node) TESTEND 
			}

	}   TESTEND {
			if {$state == "TESTEND"} {
				set m_node_state($node) SHUTDOWN
				puts $cid SHUTDOWN
				flush $cid
				
				foreach to_cid $m_cids {
					if {$to_cid == $cid} {
						continue
					}
					set node $m_cid_node_map($to_cid)
					set m_node_state($node) SHUTDOWN 
					puts $to_cid SHUTDOWN 
					flush $to_cid
				}
			}

	}   default {

	}
	return
}

proc Setup {nodefile linkfile} {

	set keys ""

	set fd [open $nodefile r]
	while {[gets $fd line] > -1} {
    	set nodename [lindex $line 0]
    	set compfile [subst [lindex $line 1]]
    	set compname [Blk_helper::Parse $compfile]
    	Blk_helper::Add_node $nodename $compname
	}
	close $fd

	set fd [open $linkfile r]
	while {[gets $fd line] > -1} {
    	set fromname [lindex $line 0]
    	set toname [lindex $line 2]
    	set fromport [lindex $line 1]
    	set toport [lindex $line 3]
    	set fifo_len [lindex $line 4]

    	set frommsgname [Blk_helper::Get_port_msgdef $fromname 0 $fromport]
    	set tomsgname [Blk_helper::Get_port_msgdef $toname 1 $toport]
    	if {$frommsgname != $tomsgname} {
        	puts "$line not professed for incompatible msgdef $frommsgname vs $tomsgname"
        	continue
    	}

    	set msgname [Msgdef::Parse $tomsgname]
    	set size [Msgdef::Get_Max_Size $msgname]

    	set key [Key_helper::Create_key $line]
    	Blk_helper::Add_fifo_len $fromname 0 $fromport $key $fifo_len $size
    	Blk_helper::Add_fifo_len $toname 1 $toport $key $fifo_len $size
    	lappend keys $key
	}
	close $fd

	# Allocate the sharedmem with the key reference.
	foreach token [Blk_helper::Get_keys] {
    	set key [lindex $token 0]
    	set len [lindex $token 1]
    	set size [lindex $token 2]

    	stub_init $key $len $size 
    	stub_clear $key $len $size
	}
}

proc Execute {alloc_port} {
	global env

	foreach node [Blk_helper::Get_nodes] {
    	set cmd "exec tclsh $env(DISK2)/sharedmem/tcl/node/node.tcl BLOCK $node INIT localhost:$alloc_port "
    	append cmd [Blk_helper::Gen_str $node]
    	append cmd " RUNNING 0 &"
    	eval $cmd
	}
}

}
