proc statechange {} {
    global g_state

    if {$g_state == "STATE_1"} {
	set g_state STATE_2_3
    } elseif {$g_state == "STATE_2_3"} {
	set g_state STATE_2
    } elseif {$g_state == "STATE_2"} {
	set g_state STATE_3
    } else {
	set g_state STATE_1
    }
    return
}

proc process {inport p_ip} {
    global g_state
    global g_timestamp
 
    set rc "" 
    set data [byRetry::get_retry $p_ip]

    #puts $data
    set timestamp_cur [clock seconds]
    if {[expr $timestamp_cur - $g_timestamp] > 5} {
	set g_timestamp $timestamp_cur
	statechange
    	if {$g_state == "STATE_1"} {
	    set rc [list "IN-1"] 
    	} elseif {$g_state == "STATE_2_3"} {
	    set rc [list IN-2 IN-3] 
    	} elseif {$g_state == "STATE_2"} {
	    set rc [list "IN-2"]
    	} elseif {$g_state == "STATE_3"} {
	    set rc [list "IN-3"]
    	}
    }
    return $rc
}

proc init {datalist} {
    global g_state
    global g_timestamp

    set g_timestamp [clock seconds]
    set g_state STATE_1
    return
}

proc shutdown {} {
    return 
}

source $env(COMP_HOME)/ip2/byRetry.tcl

variable g_state
variable g_timestamp
