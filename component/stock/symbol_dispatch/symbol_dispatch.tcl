proc map_exchange {exchange} {
    if {$exchange == "T"} {
	return "T"
    } else {
	return "X"
    }
}

proc dispatch {symbol exchange crawler port} {

    set p_ip [ip::source]
    byRetry::init $p_ip
    byRetry::set_retry $p_ip 0
    byList::init $p_ip
    byList::set_list $p_ip "$symbol [map_exchange $exchange]"
    byList::set_crawler $p_ip $crawler 
    server_send $p_ip OUT-$port
    ip::sink $p_ip
    return
}

proc process {inport p_ip} {
    global g_tsx_exchange
    global g_grouplist
    global .msg
    global g_cur_group
    global g_cur_page

    set rc ""
    array set data [byList::get_list $p_ip] 
    set urlerror $data(urlerror)
    if {$urlerror != ""} {
	server_log "ERROR" "rc = $urlerror"
	return $rc
    }

    	set symbollist $data(symbollist)

    	set maxtoken [llength $symbollist]
    	for {set i 0} {$i < $maxtoken} {incr i} {
    	    set symbollist_data [lindex $symbollist $i]
	    dispatch $symbollist_data $g_tsx_exchange "financials" 0 
	    dispatch $symbollist_data $g_tsx_exchange "fundamental" 1 
	    dispatch $symbollist_data $g_tsx_exchange "company" 2 
    	}

    return $rc
}

proc init {datalist} {
    global g_tsx_exchange

    set g_tsx_exchange [lindex $datalist 0]
    return
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(COMP_HOME)/ip2/byRetry.tcl
