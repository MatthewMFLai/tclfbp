proc map_exchange {exchange} {
    if {$exchange == "T"} {
	return "T"
    } else {
	return "X"
    }
}

proc get_symbolpage {} {
    global g_tsx_exchange
    global g_cur_group
    global g_cur_page
    global .msg

    .msg configure -text "Group $g_cur_group page $g_cur_page $g_tsx_exchange"
    set p_ip [ip::source]
    byRetry::init $p_ip
    byRetry::set_retry $p_ip 0
    byList::init $p_ip
    byList::set_list $p_ip [list $g_cur_group $g_cur_page $g_tsx_exchange] 
    byList::set_crawler $p_ip "symbolpage" 
    server_send $p_ip OUT-0
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
	server_log "ERROR" "rc = $urlerror group = $group page = $page"
	return $rc
    }

    set total_page $data(total_page)
    if {$total_page != 0} {
    	set symbollist $data(symbollist)
    	set symbollink $data(symbollink)

    	set maxtoken [llength $symbollist]
    	for {set i 0} {$i < $maxtoken} {incr i} {
    	    set symbollist_data [lindex $symbollist $i]
    	    set p_ip [ip::source]
	    byRetry::init $p_ip
	    byRetry::set_retry $p_ip 0
    	    byList::init $p_ip
    	    byList::set_list $p_ip "$symbollist_data [map_exchange $g_tsx_exchange]"
    	    byList::set_crawler $p_ip "financials" 
    	    server_send $p_ip OUT-1
	    ip::sink $p_ip

	    set symbollink_data [lindex $symbollink $i]
    	    set p_ip [ip::source]
	    byRetry::init $p_ip
	    byRetry::set_retry $p_ip 0
    	    byList::init $p_ip
    	    byList::set_list $p_ip $symbollink_data
    	    byList::set_crawler $p_ip "fundamental" 
    	    server_send $p_ip OUT-2
	    ip::sink $p_ip
    	}
    }

    set next_group ""
    set next_page ""
    if {[getnext $g_cur_group $g_cur_page $total_page next_group next_page]} {
    	set g_cur_group $next_group 
    	set g_cur_page $next_page
 
	get_symbolpage
    } else {	
    	.msg configure -text "Finish"
    }
    return $rc
}

proc init {datalist} {
    global g_tsx_exchange
    global g_grouplist
    global g_cur_group
    global g_cur_page
    global env

    set g_grouplist [lindex $datalist 1]
    set g_tsx_exchange [lindex $datalist 0]

    set g_cur_group [lindex $g_grouplist 0]
    set g_cur_page 1
}

proc kicker {datalist} {
    get_symbolpage
}

proc shutdown {} {
}

proc getnext {cur_group cur_page max_page p_group p_page} {
    global g_grouplist
    upvar $p_group group
    upvar $p_page page

    set toloop 1
    set newgroup 0

    if {$cur_page == $max_page ||
        $max_page == 0} {
	set page 1
	set newgroup 1
    } else {
	set page [expr $cur_page + 1]
    } 

    if {$newgroup} {
    	if {[lindex $g_grouplist end] != $cur_group} {
    	    set idx [lsearch $g_grouplist $cur_group]
	    incr idx
	    set group [lindex $g_grouplist $idx]
    	} else {	
	    #set group [lindex $g_grouplist 0]
	    set toloop 0
	}	
    } else {
	set group $cur_group
    }
    return $toloop 
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(COMP_HOME)/ip2/byGroup.tcl
source $env(COMP_HOME)/ip2/byRetry.tcl

package require Tk
button .msg -text OK
pack .msg

#------------------------------

#source $env(WEB_DRIVER)/loadall/loadall.tcl
