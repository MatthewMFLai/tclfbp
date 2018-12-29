proc process {inport p_ip} {
    global g_repeat
    global g_next_crawler

    set rc "" 
    set url [byList::get_list $p_ip]
    set crawler [byList::get_crawler $p_ip]
    set repeat $g_repeat
    while {$repeat} {
    	array set data {}
    	process_$crawler $url data
	set urlerror $data(urlerror) 
        if {$urlerror == ""} {
            break
        }
        if {$urlerror == "N/A"} {
            set repeat 0
	    break
        }
        if {[string first "FAILfsm" $urlerror] > -1} {
            set repeat 0 
        } else {
	    incr repeat -1
	    unset data
	}
    }
    if {$repeat == 0} {
        server_log "ERROR" "rc = $urlerror url = $url"
    	set p_out [ip::clone $p_ip]
    	byList::remove $p_out
    	byList::init $p_out
    	byList::set_list $p_out $url
    	byList::set_crawler $p_out $crawler
    	byList::set_urlerror $p_out $urlerror
    	server_send $p_out OUT-2
    	ip::sink $p_out
        return $rc
    }

    set p_out [ip::clone $p_ip]
    byList::remove $p_out
    byList::init $p_out
    byList::set_list $p_out [array get data]
    if {$g_next_crawler($crawler) != ""} {
	byList::set_crawler $p_out $g_next_crawler($crawler)
    }
    server_send $p_out OUT-1
    ip::sink $p_out
    return $rc
}

proc init {datalist} {
    global g_repeat
    global g_next_crawler
    global env

    Url::init
    Fsm::Init
    foreach tuple [lrange $datalist 2 end] { 
    	set crawler [lindex $tuple 0]
	set arglist [lindex $tuple 1]
    	set to_crawler [lindex $tuple 2]
    	loadeach $env(WEB_DRIVER) $crawler
	# Kludge
	if {$crawler == "financials"} {
	    source $env(WEB_DRIVER)/financials/symbol_filter.tcl
	}
	source $env(COMP_HOME)/stock/$crawler/$crawler.tcl
	init_$crawler $arglist
    	set g_next_crawler($crawler) $to_crawler
    }
    set g_repeat [lindex $datalist 0]
    return
}

proc shutdown {} {
}

package require htmlparse
source $env(COMP_HOME)/ip2/byList.tcl
source $env(WEB_DRIVER)/loadall/loaddir.tcl
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/geturl.tcl
