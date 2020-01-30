proc process {} {
	global g_data

    array set msgin {}
    set rc [port_read_once IN-1 msgin]
	if {!$rc} {
		set msgin($g_data(mux)) "1"
		port_write OUT-1 msgin
	}

    set rc [port_read_once IN-2 msgin]
	if {!$rc} {
		set msgin($g_data(mux)) "2"
		port_write OUT-1 msgin
	}

    set rc [port_read_once IN-3 msgin]
	if {!$rc} {
		set msgin($g_data(mux)) "3"
		port_write OUT-1 msgin
	}
    return
}

proc app_test {} {
    return
}

proc app_init {} {
	global argdata
	global g_data

	set g_data(mux) [lindex $argdata(DATA) 0] 
    return "OK"
}

