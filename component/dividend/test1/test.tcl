proc process {count} {

    array set msgout {}
    port_factory_msg OUT-1 msgout
    set msgout(exchange) "TO"
    set msgout(symbol) "fts"
    port_write OUT-1 msgout

    array set msgin {}
    port_read IN-1 msgin
    if {[string length $msgin(urlerror)] == 0} {
        foreach idx [array names msgin] {
			puts "$idx $msgin($idx)"
		}
		client_send "TESTEND"
    }
	unset msgin

    return
}

proc app_test {} {
    return
}

proc app_init {} {
    return "OK"
}
