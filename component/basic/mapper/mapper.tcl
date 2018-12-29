proc send_request {datalist outport} {
    global g_crawler

    set p_ip [ip::source]
    byList::init $p_ip
    byList::set_list $p_ip $datalist
    server_send $p_ip $outport 
    ip::sink $p_ip
    return
}

proc process {inport p_ip} {
    global g_mapper
    global g_keylist

    set rc ""
    set keylist ""
    if {$inport == "IN-1"} {
	array set newkeyval {}
    	array set curkeyval [byList::get_list $p_ip]
	foreach idx [array names curkeyval] {
	    if {[info exists g_mapper($idx)]} {
		set val $curkeyval($idx)
		set key $g_mapper($idx)
		set newkeyval($key) $val
		lappend keylist $key
	    }
	}
	foreach key [UtilSet::ldifference $g_keylist $keylist] {
	    set newkeyval($key) ""
	}
	send_request [array get newkeyval] OUT-1

    } else {

    }
    return $rc
}

proc init {datalist} {
    global g_mapper
    global g_keylist

    set g_keylist ""
    set filename [lindex $datalist 0]
    if {[file exists $filename] } {
	set fd [open $filename "r"]
	while {[gets $fd line] > -1} {
	    array set g_mapper $line
	    lappend g_keylist [lindex $line 1]
	}
	close $fd
    } else {
	puts "mapper: $filename does not exist."
    }
    return
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(PATTERN_HOME)/set.tcl
