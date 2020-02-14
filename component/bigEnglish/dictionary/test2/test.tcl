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

	array set msg {cmd READ word root meanings {}}
	send OUT-1 msg
	if {![read IN-1 meanings "12345 67890"]} {
		return
	}
	unset msg

	array set msg {cmd READ word root2 meanings {}}
	send OUT-1 msg
	if {![read IN-1 meanings "12345 67890"]} {
		return
	}
	unset msg

	array set msg {cmd READ word root3 meanings {}}
	send OUT-1 msg
	if {![read IN-1 meanings "12345 67890"]} {
		return
	}
	unset msg

	array set msg {cmd CHECK sentence {abc root def root2 ghi root3} marker {abc root def root2 ghi root3}}
	send OUT-1 msg
	if {![read IN-1 marker "abc WORD def WORD ghi WORD"]} {
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
