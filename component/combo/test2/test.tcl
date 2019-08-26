proc process {} {
    global g_msgcount

    if {$g_msgcount} {
    	array set msgin {}
    	port_read IN-1 msgin
	}
	
	set rc 1 

    array set msgout {}
    port_factory_msg OUT-1 msgout
    set msgout(exchange) "TO"
    set msgout(symbol) "RY"
    set msgout(rqsttype) "COMPANY"
    port_write OUT-1 msgout

    array set msgin {}
    port_read IN-1 msgin
    if {[string length $msgin(description)] < 1000} {
		set rc 0
    } else {
		puts "COMPANY passed"
	}
	unset msgin
    unset msgout

    array set msgout {}
    port_factory_msg OUT-1 msgout
    set msgout(exchange) "T"
    set msgout(symbol) "RY"
    set msgout(rqsttype) "STOCK"
    port_write OUT-1 msgout

    array set msgin {}
    port_read IN-2 msgin
    if {[string length $msgin(market_cap)] <= 10} {
		set rc 0	
    } else {
		puts "STOCK passed"
	}
	unset msgin
    unset msgout

    array set msgout {}
    port_factory_msg OUT-1 msgout
    set msgout(exchange) "TO"
    set msgout(symbol) "fts"
    set msgout(rqsttype) "DIVIDEND"
    port_write OUT-1 msgout

    array set msgin {}
    port_read IN-3 msgin
    if {[string length $msgin(urlerror)] == 0} {
		puts "DIVIDEND passed"
    } else {
		set rc 0
	}
	unset msgin
    unset msgout

	if {$rc} {
		client_send "TESTEND"
	}
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
