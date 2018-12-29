proc process {} {
    global g_tablelist

    if {[llength $g_tablelist] == 0} {
	return 0
    }
    set p_ip [ip::source]
    byList::init $p_ip
    byList::set_list $p_ip [lindex $g_tablelist 0]
    byList::set_crawler $p_ip "table" 
    server_send $p_ip OUT-1
    ip::sink $p_ip

    set g_tablelist [lrange $g_tablelist 1 end]
    return 1
}

proc init {datalist} {
    global g_tablelist

    set g_tablelist $datalist
    return
}

proc kicker {datalist} {
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(COMP_HOME)/ip2/byRetry.tcl

#source $env(WEB_DRIVER)/loadall/loadall.tcl
