proc process {} {
    global g_msgcount

	if {$g_msgcount} {
		yield
		return
	}

    array set msgout {}

    port_factory_msg OUT-1 msgout
    set msgout(f1) "aaaa"
    port_write OUT-1 msgout
    set msgout(f1) "bbbb"
    port_write OUT-1 msgout
    set msgout(f1) "aaaa"
    port_write OUT-1 msgout
    set msgout(f1) "bbbb"
    port_write OUT-1 msgout

    port_factory_msg OUT-2 msgout
    set msgout(f1) "cccc"
    port_write OUT-2 msgout
    set msgout(f1) "dddd"
    port_write OUT-2 msgout
    set msgout(f1) "cccc"
    port_write OUT-2 msgout
    set msgout(f1) "dddd"
    port_write OUT-2 msgout

    port_factory_msg OUT-3 msgout
    set msgout(f1) "eeee"
    port_write OUT-3 msgout
    set msgout(f1) "ffff"
    port_write OUT-3 msgout
    set msgout(f1) "eeee"
    port_write OUT-3 msgout
    set msgout(f1) "ffff"
    port_write OUT-3 msgout

	unset msgout

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "aaaa"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "bbbb"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-2 msgin
    if {$msgin(f1) != "cccc"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-2 msgin
    if {$msgin(f1) != "dddd"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-3 msgin
    if {$msgin(f1) != "eeee"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-3 msgin
    if {$msgin(f1) != "ffff"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "aaaa"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "bbbb"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-2 msgin
    if {$msgin(f1) != "cccc"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-2 msgin
    if {$msgin(f1) != "dddd"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-3 msgin
    if {$msgin(f1) != "eeee"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-3 msgin
    if {$msgin(f1) != "ffff"} {
		client_send "TESTFAIL"
		return
    }
	unset msgin

	client_send "TESTEND"
    set g_msgcount 1 
	yield

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
