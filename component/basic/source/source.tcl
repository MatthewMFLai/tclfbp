proc process {inport p_ip} {
    global g_limit
 
    set rc "" 
    set data [byRetry::get_retry $p_ip]
    incr data
    if {$data == $g_limit} {
	set data 0
    }
    byRetry::set_retry $p_ip $data
    server_send $p_ip OUT-1
    return $rc
}

proc init {datalist} {
    global g_limit

    set g_limit [lindex $datalist 0] 
}

proc kicker {datalist} {
    set p_ip [ip::source]
    byRetry::init $p_ip
    byRetry::set_retry $p_ip 0
    server_send $p_ip OUT-1
    ip::sink $p_ip
    return
}

proc shutdown {} {
    return
}

source $env(COMP_HOME)/ip2/byRetry.tcl

variable g_limit
