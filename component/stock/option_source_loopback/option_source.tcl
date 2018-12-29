proc get_optionlist {} {
    global g_url

    set p_ip [ip::source]
    byRetry::init $p_ip
    byRetry::set_retry $p_ip 0
    byList::init $p_ip
    byList::set_list $p_ip [list $g_url]
    byList::set_crawler $p_ip "optionlist" 
    server_send $p_ip OUT-0
    ip::sink $p_ip
    return
}

proc process {inport p_ip} {
    global g_optionlist
    global .msg

    set rc ""
    array set data [byList::get_list $p_ip] 
    set urlerror $data(urlerror)
    if {$urlerror != ""} {
	server_log "ERROR" "rc = $urlerror group = $group page = $page"
	return $rc
    }

    foreach option $data(optionlist) {
	set idx [string first "=" $option]
	if {$idx == -1} {
	    continue
	}
	incr idx
	set idx2 [string first "\*" $option $idx]
	incr idx2 -1
	set symbol [string range $option $idx $idx2]
    	.msg configure -text "Processing option symbol $symbol"

        set p_ip [ip::source]
    	byRetry::init $p_ip
    	byRetry::set_retry $p_ip 0
    	byList::init $p_ip
    	byList::set_list $p_ip $option 
    	byList::set_crawler $p_ip "options" 
    	server_send $p_ip OUT-1
	ip::sink $p_ip
    }
    .msg configure -text "Finish"
    return $rc
}

proc init {datalist} {
    global g_optionlist
    global g_url

    set g_url [lindex $datalist 0]
    set g_optionlist ""
}

proc kicker {datalist} {
    get_optionlist
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(COMP_HOME)/ip2/byGroup.tcl
source $env(COMP_HOME)/ip2/byRetry.tcl

package require Tk
button .msg -text OK
pack .msg

#------------------------------
