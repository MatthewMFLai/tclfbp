proc process {} {
    global g_msgcount

    if {$g_msgcount} {
    	array set msgin {}
    	port_read IN-1 msgin
	}

    array set msgout {}
    port_factory_msg OUT-1 msgout
    port_write OUT-1 msgout
	unset msgout

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(sys_mux1port) != "1"} {
		return
    }
	unset msgin

    array set msgout {}
    port_factory_msg OUT-2 msgout
    port_write OUT-2 msgout
	unset msgout

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(sys_mux1port) != "2"} {
		return
    }
	unset msgin

    array set msgout {}
    port_factory_msg OUT-3 msgout
    port_write OUT-3 msgout
	unset msgout

    array set msgin {}
    port_read IN-1 msgin
    if {$msgin(sys_mux1port) != "3"} {
		return
    }
	unset msgin
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
