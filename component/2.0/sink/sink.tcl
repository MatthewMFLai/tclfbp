proc process {} {

    array set msgin {}
    port_read IN-1 msgin
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
