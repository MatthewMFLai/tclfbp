proc process {count} {
    global g_msgcount

    if {$g_msgcount} {
    	array set msgin {}
    	port_read IN-1 msgin
	}

    array set msgout {}
    port_factory_msg OUT-1 msgout
    set msgout(exchange) "T"
    set msgout(symbol) "RY"
    port_write OUT-1 msgout

    array set msgin {}
    port_read IN-1 msgin
    if {[string length $msgin(market_cap)] > 10} {
		client_send "TESTEND"
    }
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
