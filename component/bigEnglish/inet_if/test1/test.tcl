proc send {port p_msg} {
	upvar $p_msg msg
	array set msgout {}
	port_factory_msg $port msgout
	foreach idx [array names msg] {
		set msgout($idx) $msg($idx)
	}
	port_write $port msgout
	unset msgout
	return
}

proc read {port idx data} {
    array set msgin {}
    port_read $port msgin
    if {$msgin($idx) != $data} {
		unset msgin
		return 0
    }
	unset msgin
	return 1
}

proc process {} {
    global g_msgcount

    if {$g_msgcount} {
    	array set msgin {}
    	port_read IN-1 msgin
	}

	array set msg {mode CACHE_SET words {aaa bbb ccc ddd}}
	send OUT-2 msg
	unset msg

	array set msg {words {aaa b101 ccc d202 eee fff}}
	send OUT-1 msg
	if {![read IN-2 words "eee fff"]} {
		return
	}
	if {![read IN-1 word "b101"]} {
		return
	}
	if {![read IN-1 word "d202"]} {
		return
	}
	unset msg

	array set msg {mode CACHE_DEL words {bbb ddd}}
	send OUT-2 msg
	unset msg

	array set msg {words {bbb ddd}}
	send OUT-1 msg
	if {![read IN-2 words ""]} {
		return
	}
	if {![read IN-1 word "bbb"]} {
		return
	}
	if {![read IN-1 word "ddd"]} {
		return
	}
	unset msg

	# All input words recognized, nothing out from inet_if::outport-1
	array set msg {words {aaa ccc}}
	send OUT-1 msg
	if {![read IN-2 words ""]} {
		return
	}
	array set msgin {}
	if {![port_read_once IN-1 msgin]} {
		return
	}
	unset msg

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
