proc process {inport p_ip} {
    global g_filterlist

    set rc ""
    array set data [byList::get_list $p_ip]
    foreach idx [array names data] {
	set line $data($idx)
	if {$line == ""} {
	    continue
	}
	set toskip 0
	foreach filterline $g_filterlist {
	    if {[string first $filterline $line] > -1} {
		set toskip 1
		break
	    }
	}
	if {$toskip} {
	    continue
	}

    	set p_ip [ip::source]
    	byList::init $p_ip
    	byList::set_list $p_ip [list line $line]
    	server_send $p_ip OUT-1
    	ip::sink $p_ip
    }
    return $rc
}

proc init {datalist} {
    global g_filterlist

    set g_filterlist ""
    set filterfile [lindex $datalist 0]
    if {$filterfile == ""} {
	return
    }
    if {![file exists $filterfile]} {
	return
    }
    set fd [open $filterfile r]
    while {[gets $fd line] > -1} {
	lappend g_filterlist $line
    }
    close $fd
    return
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
