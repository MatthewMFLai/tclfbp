proc process {} {
	global g_count
	global g_count_max
	global g_port

    array set msgin {}
	port_read IN-$g_port msgin
    port_write OUT-$g_port msgin
	incr g_count -1
	if {$g_count == 0} {
		set g_count $g_count_max
		incr g_port
		if {$g_port > 3} {
			set g_port 1
		}
	}
    return
}

proc app_test {} {
    return
}

proc app_init {} {
	global g_count
	global g_count_max
	global g_port

	set g_count_max 2
	set g_count $g_count_max
	set g_port 1

    return "OK"
}
