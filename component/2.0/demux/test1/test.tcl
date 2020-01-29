proc process {} {
    global g_msgcount

    if {$g_msgcount} {
    	array set msgin {}
    	port_read IN-1 msgin
	}

    array set msgout {}
    port_factory_msg OUT-1 msgout
	set msgout(sys_mux1port) "1"
    port_write OUT-1 msgout
	unset msgout

    array set msgin {}
    port_read IN-1 msgin
	unset msgin

    array set msgout {}
    port_factory_msg OUT-1 msgout
	set msgout(sys_mux1port) "2"
    port_write OUT-1 msgout
	unset msgout

    array set msgin {}
    port_read IN-2 msgin
	unset msgin

    array set msgout {}
    port_factory_msg OUT-1 msgout
	set msgout(sys_mux1port) "3"
    port_write OUT-1 msgout
	unset msgout

    array set msgin {}
    port_read IN-3 msgin
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
