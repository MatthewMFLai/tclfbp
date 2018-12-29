proc process {inport p_ip} {
 
    set rc "" 
    set data [byRetry::get_retry $p_ip]
    return $rc
}

proc init {datalist} {
    return
}

proc shutdown {} {
    return
}

source $env(COMP_HOME)/ip2/byRetry.tcl

