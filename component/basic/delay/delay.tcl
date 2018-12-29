proc process {inport p_ip} {
    global g_max_delay
    after [expr int(rand() * $g_max_delay)]
}

proc init {datalist} {
    global g_max_delay
    set g_max_delay [lindex $datalist 0]
}

proc shutdown {} {
}
