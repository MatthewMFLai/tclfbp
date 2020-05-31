proc process {} {

    array set msgin {}
    port_read IN-1 msgin
	for {set i 1} {$i <= ZZZ_NUM_OUTPORT} {incr i} {
		array set msgout [array get msgin]
    	port_write OUT-$i msgout
		unset msgout
	}
    return
}

proc app_test {} {
    return
}

proc app_init {} {
    return "OK"
}
