proc process {count} {
    global g_symbols

	foreach symbol $g_symbols {

    	array set msgout {}
    	port_factory_msg OUT-1 msgout
    	set msgout(exchange) "T"
    	set msgout(symbol) $symbol 
    	port_write OUT-1 msgout

    	array set msgin {}
    	port_read IN-1 msgin
		puts "$msgin(symbol) $msgin(market_cap)"
    	unset msgout
		unset msgin
    }
	client_send "TESTEND"

    return
}

proc app_test {} {
    global g_msgcount

    return $g_msgcount
}

proc app_init {} {
    global env g_symbols

    set fd [open $env(COMP_HOME)/shares/test2/symbols_gm.dat r]
    set g_symbols ""
    while {[gets $fd line] > -1} {
		lappend g_symbols [lindex $line 0]
	}
	close $fd
    return "OK"
}
