proc send {port} {
    array set msgout {}
    port_factory_msg $port msgout
    port_write $port msgout
	unset msgout
	return
}

proc read {port} {
    array set msgin {}
    port_read $port msgin
    if {$msgin(sys_mux1port) != "PORT0"} {
		unset msgin
		return 0
    }
	unset msgin
	return 1
}

proc process {} {
    global g_msgcount

    if {$g_msgcount} {
    	array set msgin {}
    	port_read IN-1 msgin
	}

	send OUT-1
	if {![read IN-1]} {
		return
	}

	send OUT-1
	if {![read IN-2]} {
		return
	}

	send OUT-1
	if {![read IN-3]} {
		return
	}

	send OUT-1
	if {![read IN-4]} {
		return
	}

	send OUT-1
	if {![read IN-1]} {
		return
	}

	send OUT-1
	if {![read IN-2]} {
		return
	}

	send OUT-1
	if {![read IN-3]} {
		return
	}

	send OUT-1
	if {![read IN-4]} {
		return
	}

	client_send "TESTEND"

	incr g_msgcount
    return
}

proc app_test {} {
    global g_msgcount

    return $g_msgcount
}

proc app_init {} {
    global g_msgcount

    set g_msgcount 0
    return "OK"
}
