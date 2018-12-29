proc send_request {url outport} {
    set p_ip [ip::source]
    byRetry::init $p_ip
    byRetry::set_retry $p_ip 0
    byList::init $p_ip
    byList::set_list $p_ip "$url"
    byList::set_crawler $p_ip "hp" 
    server_send $p_ip $outport 
    ip::sink $p_ip
    return
}

proc send_data {p_data outport} {
    global g_stopdate
    upvar $p_data data

    set rc 1
    set listdata ""
    foreach idx [array names data] {
	if {![string is digit $idx]} {
	    continue
	}
	if {[UtilTime::Compare $idx $g_stopdate] == -1} {
	    set rc 0
	    continue
	}
	lappend listdata $idx
	lappend listdata $data($idx)
    }	
    set p_ip [ip::source]
    byList::init $p_ip
    #byList::set_list $p_ip "$listdata"
    byList::set_list $p_ip [array get data] 
    server_send $p_ip $outport 
    ip::sink $p_ip
    return $rc
}

proc process {inport p_ip} {
    global g_request

    set rc ""
    if {$inport == "IN-1"} {
    	set symbol [lindex [byList::get_list $p_ip] 0] 
    	set symbol [UtilStock::Convert_Symbol $symbol "GM" "YAHOO"]
    	regsub "ZZZZ" $g_request $symbol url
	send_request $url OUT-1

    } else {

    	array set data [byList::get_list $p_ip] 
        if {$data(urlerror) != ""} {
	    puts "HP error: $data(urlerror)"
	    return $rc
	}
        if {![info exists data(Next)]} {
	    puts "HP: no data for $data(SYMBOL)"
	    return $rc
	}
    	set nextlink $data(Next) 
	set symbol [UtilStock::Convert_Symbol $data(SYMBOL) "YAHOO" "GM"]
	unset data(Next)
	unset data(urlerror)
	# Replace yahoo symbol with globemail symbol.
	set data(SYMBOL) $symbol
	# Send time sorted historical data out to other components.
	set to_continue [send_data data OUT-2]
	# Get more data if link is not empty.
	if {$nextlink != "" &&
	    $to_continue} {
    	    set url "http://finance.yahoo.com$nextlink"
	    send_request $url OUT-1
	}
    }
    return $rc
}

proc init {datalist} {
    global g_request
    global g_stopdate

    # Init data looks like {T Nov 8 2012 Nov 8 2011}
    set exchange [UtilStock::Convert_Exchange [lindex $datalist 0] "GM" "YAHOO"]
    set day [lindex $datalist 2]
    set month [UtilTime::Convert_Month [lindex $datalist 1]]
    # Yahoo month seems to start from 0 !
    incr month -1
    set year [lindex $datalist 3]
    set g_request "http://finance.yahoo.com/q/hp?a=&b=&c=&d=$month&e=$day&f=$year&g=d&s=ZZZZ.$exchange&ql=1"
    set g_stopdate [UtilTime::Convert [lrange $datalist 4 end]]
    puts "g_stopdate = $g_stopdate"
    return
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(COMP_HOME)/ip2/byRetry.tcl
source $env(PATTERN_HOME)/time_util.tcl
source $env(PATTERN_HOME)/stock_util.tcl
