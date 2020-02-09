proc process {} {
	global g_data

    array set msgin {}
    port_read IN-1 msgin

	set loop 1
	while {$loop} {

    	set rc [port_write_once OUT-$g_data(port) msgin]
		incr g_data(port)
		if {$g_data(port) > $g_data(port_max)} {
			set g_data(port) 1
		}

		if {!$rc} {
			set loop 0	
		} else {
			// Just so we don't get stuck in the infinite while do loop
			// if all downstream ports remain congested.
			yield
		}
	}
    return
}

proc app_test {} {
    return
}

proc app_init {} {
	global g_data

	array set g_data {port 1 port_max 4}
    return "OK"
}

