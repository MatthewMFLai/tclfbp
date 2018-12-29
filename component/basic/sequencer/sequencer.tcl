proc process {inport p_ip} {
    global g_count
    global g_limit
    global g_data
 
    set rc "" 
    set data [byRetry::get_retry $p_ip]

    puts $data
    lappend g_data($inport) $data
    incr g_count($inport)
    after [expr int(floor(rand() * 100))]
    if {$g_count($inport) >=  $g_limit} {
	if {$inport == "IN-1"} {
	    set rc [list IN-2 IN-3] 
	} elseif {$inport == "IN-2"} {
	    if {$g_count(IN-3) != $g_limit} {
	        set rc [list "IN-3"]
	    } else {
	        set rc [list "IN-1"]
    		array set g_count {IN-1 0 IN-2 0 IN-3 0} 
	    }
	} elseif {$inport == "IN-3"} {
	    if {$g_count(IN-2) != $g_limit} {
	        set rc [list "IN-2"]
	    } else {
	        set rc [list "IN-1"]
    		array set g_count {IN-1 0 IN-2 0 IN-3 0} 
	    }
	} else {
	}
    }
    return $rc
}

proc init {datalist} {
    global g_count
    global g_limit
    global g_data

    array set g_count {IN-1 0 IN-2 0 IN-3 0} 
    array set g_data {IN-1 {} IN-2 {} IN-3 {}}
    if {$datalist == "" || [lindex $datalist 0] == ""} {
    	set g_limit 10
    } else {
	set g_limit [lindex $datalist 0]
    }
}

proc shutdown {} {
    global g_data

    foreach port [array names g_data] {
        set datalist $g_data($port)
	set base [lindex $datalist 0]
	set len [llength $datalist]
	for {set i 1} {$i < $len} {incr i} {
	    set data [expr $base + $i]
	    if {$data != [lindex $datalist $i]} {
		puts "$port data corrupted."
		break
	    }
	}
	puts "$port data is clean."
    }
    return
}

source $env(COMP_HOME)/ip2/byRetry.tcl

variable g_count
variable g_limit
variable g_data
