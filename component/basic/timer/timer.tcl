proc process {} {
    foreach outport [get_outports] {
    	set p_ip [ip::source]
    	byList::init $p_ip
    	byList::set_list $p_ip {} 
    	byList::set_crawler $p_ip "TIMER" 
    	server_send $p_ip $outport 
    	ip::sink $p_ip
    }
    return 1
}

proc init {datalist} {
    return
}

proc kicker {datalist} {
    return
}

proc shutdown {} {
    return
}

source $env(COMP_HOME)/ip2/byList.tcl
