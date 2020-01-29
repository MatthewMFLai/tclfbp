proc process {} {
	global g_data

    array set msgin {}
    port_read IN-1 msgin

	set outport $msgin($g_data(mux))
	port_write OUT-$outport msgin
    return
}

proc app_test {} {
    return
}

proc app_init {} {
	global g_data

	set g_data(mux) "sys_mux1port"
    return "OK"
}
