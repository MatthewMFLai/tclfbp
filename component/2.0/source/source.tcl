proc process {} {
    global g_msgcount

	if {$g_msgcount == 0} {
    	array set msgout {}
    	port_factory_msg OUT-1 msgout
    	set msgout(f1) "aaaa"
    	port_write OUT-1 msgout
		unset msgout
		set g_msgcount 1
		return
	}

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(f1) == "aaaa"} {
		set msgin(f1) "bbbb"
	} elseif {$msgin(f1) == "bbbb"} {
		set msgin(f1) "cccc"
	} elseif {$msgin(f1) == "cccc"} {
		set msgin(f1) "dddd"
	} elseif {$msgin(f1) == "dddd"} {
		set msgin(f1) "eeee"
	} elseif {$msgin(f1) == "eeee"} {
		set msgin(f1) "ffff"
    } else {
		set msgin(f1) "aaaa"
	}
    port_write OUT-1 msgin
	unset msgin

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
