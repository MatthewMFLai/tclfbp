namespace eval FbpDraw {

proc gen_block_file {filename p_blockname_map} {
    variable m_block
    variable m_portqueue
    upvar $p_blockname_map blockname_map

    set fd [open $filename w]
    foreach systemid [array names blockname_map] {
	set displayname $blockname_map($systemid)
	block_get $systemid filename filepath init kicker inports outports \
            ipaddr timeout portset
	set line "Block "
	append line "$displayname "
	append line $filepath/$filename\.tcl
	if {$init != "" || $kicker != ""} {
	    append line " "
	    append line "\{$init\} $kicker"
	}
	puts $fd $line
	if {$inports != ""} {
	    set line "InPort "
	    append line $inports
	    puts $fd $line
	} 
	if {$outports != ""} {
	    set line "OutPort "
	    append line $outports
	    puts $fd $line
	}
	foreach port $inports {
	    set portname [gen_portname $systemid INPORT $port]
	    if {[info exists m_portqueue($portname)]} {
		puts $fd "QueueLen $port $m_portqueue($portname)"	
	    }
	}
	puts $fd "IPAddr $ipaddr"
	puts $fd "Timeout $timeout"
	if {$portset != ""} {
	    set line "Portset "
	    append line $portset
	    puts $fd $line
	}
    }
    close $fd
    return
}

proc gen_link_file {filename p_blockname_map} {
    variable m_a
    upvar $p_blockname_map blockname_map

    set fd [open $filename w]
    foreach link $m_a(edges) {
	set from_id [lindex $link 1]
	set to_id [lindex $link 2]
	
	set fromportname [get_portname $from_id]
	inv_gen_portname $fromportname fromsystemid fromporttype fromport

	set toportname [get_portname $to_id]
	inv_gen_portname $toportname tosystemid toporttype toport

	puts $fd "$blockname_map($fromsystemid) $fromport $blockname_map($tosystemid) $toport"
    }
    close $fd
    return
}

proc gen_file {win isblock} {
    global env

    set file [tk_getSaveFile]
    if {$file != ""} {
    	array set blockname_map {}
    	get_blockname_map $win "BLOCK" blockname_map
	if {$isblock} {
	    gen_block_file $file blockname_map
	} else {
	    gen_link_file $file blockname_map
	}
    }
    return
}

}
