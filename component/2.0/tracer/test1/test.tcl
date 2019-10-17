proc process {} {
    global g_msgcount

	if {$g_msgcount} {
		yield
		return
	}

    array set msgout {}
    port_factory_msg OUT-1 msgout
    port_write OUT-1 msgout
	unset msgout

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "aaaaaaaa"} {
		client_send "TESTFAIL"
		return
    }
	after 2000
	client_send "TESTEND"
	unset msgin

    set g_msgcount 1 
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
