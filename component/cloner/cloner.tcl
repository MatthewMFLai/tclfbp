proc process {} {

    array set msgin {}
    port_read IN-1 msgin
	for {set i 1} {$i <= ZZZ_NUM_OUTPORT} {incr i} {
    	port_write OUT-$i msgin
	}
    return
}

proc app_test {} {
    return
}

proc app_init {} {
    return "OK"
}