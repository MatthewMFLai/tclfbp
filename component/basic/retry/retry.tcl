proc process {inport p_ip} {
    set count [byRetry::get_retry $p_ip]

    set urlerror [byList::get_urlerror $p_ip]
    if {$count > 0 &&
        $urlerror != "N/A"} {
	incr count -1
	byRetry::set_retry $p_ip $count
	byList::set_urlerror $p_ip ""
	regsub "IN" $inport "OUT" outport
    	server_send $p_ip $outport
    }
}

proc init {datalist} {
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(COMP_HOME)/ip2/byRetry.tcl
