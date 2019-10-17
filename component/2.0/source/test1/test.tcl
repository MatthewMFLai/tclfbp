proc process {} {

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "aaaa"} {
		client_send "TESTFAIL"
		return
    }
    port_write OUT-1 msgin
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "bbbb"} {
		client_send "TESTFAIL"
		return
    }
    port_write OUT-1 msgin
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "cccc"} {
		client_send "TESTFAIL"
		return
    }
    port_write OUT-1 msgin
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "dddd"} {
		client_send "TESTFAIL"
		return
    }
    port_write OUT-1 msgin
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "eeee"} {
		client_send "TESTFAIL"
		return
    }
    port_write OUT-1 msgin
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "ffff"} {
		client_send "TESTFAIL"
		return
    }
    port_write OUT-1 msgin
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "aaaa"} {
		client_send "TESTFAIL"
		return
    }
    port_write OUT-1 msgin
	unset msgin

	client_send "TESTEND"
    array set msgin {}
    port_read IN-1 msgin

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
