proc process {} {
    global g_msgcount

    if {$g_msgcount} {
    	array set msgin {}
    	port_read IN-1 msgin
	}

    array set msgout {}
    port_factory_msg OUT-1 msgout
    set msgout(f1) "eeee"
    set msgout(f2) "ffff"
    set msgout(f3) "gggg"
    set msgout(f4) "hhhh"
    port_write OUT-1 msgout
	unset msgout

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) != "eeee" || $msgin(f2) != "ffff" ||
		$msgin(f3) != "gggg" || $msgin(f4) != "hhhh"} {
		return
    }
	unset msgin

    array set msgin {}
    port_read IN-2 msgin
    if {$msgin(f1) != "eeee" || $msgin(f2) != "ffff" ||
		$msgin(f3) != "gggg" || $msgin(f4) != "hhhh"} {
		return	
    }
	client_send "TESTEND"
	unset msgin

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
