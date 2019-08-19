namespace eval OBJNAME_FSM {

variable m_cid
variable m_cmd
variable m_data

proc init {} {
	variable m_cid
	variable m_cmd
	variable m_data

    set m_cid ""
    set m_cmd ""
    set m_data ""
	return
}

proc process_generic {p_arg_array} {
	variable m_cid
	variable m_cmd
	variable m_data
    upvar $p_arg_array arg_array

	set m_cid $arg_array(cid)
	set m_cmd $arg_array(cmd)
	set m_data $arg_array(data) 
    return
}

proc eval_init_to_enable {} {
	variable m_cmd

	if {$m_cmd == "INIT"} {
		return 1
	}
    return 0
}

proc eval_enable_to_testend {} {
	variable m_cmd

	if {$m_cmd == "ENABLE"} {
		return 1
	}
    return 0
}

proc eval_testend_to_shutdown {} {
	variable m_cmd

	if {$m_cmd == "TESTEND"} {
		return 1
	}
    return 0
}

proc act_init_to_enable {} {
	variable m_cid
	puts $m_cid ENABLE
	flush $m_cid
    return
}

proc act_enable_to_testend {} {
    return
}

proc act_testend_to_shutdown {} {
	variable m_cid
	puts $m_cid SHUTDOWN 
	flush $m_cid
    return
}

proc Dump {p_data} {

    upvar $p_data data
    return
}

}
