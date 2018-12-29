namespace eval fbp_agent_fsm {


variable m_ipaddrlist
variable m_currlist
# 2 filenames: first is the taskfile, second is the graphfile.
variable m_filename
variable m_cmd

proc init {} {
    
    variable m_ipaddrlist
    variable m_currlist
    variable m_filename
    variable m_cmd
    variable m_action
    variable m_reconnect

    set m_ipaddrlist ""
    set m_currlist ""
    set m_filename ""
    set m_cmd ""
    set m_action ""
    set m_reconnect 0

    return
}

proc get_clr_cmd {} {
    variable m_cmd

    set rc $m_cmd
    set m_cmd ""
    return $rc
}

proc process_ready {p_arg_array} {
    upvar $p_arg_array arg_array
    variable m_ipaddrlist
    variable m_filename
    variable m_reconnect

    set m_ipaddrlist $arg_array(ipaddrlist)
    lappend m_filename $arg_array(filename)
    lappend m_filename $arg_array(graphname)
    set m_reconnect $arg_array(reconnect)
    return
}

proc process_running {p_arg_array} {
    upvar $p_arg_array arg_array
    variable m_action

    set m_action $arg_array(action)
    return
}

proc process_generic {p_arg_array} {
    upvar $p_arg_array arg_array
    variable m_currlist

    set ipaddr $arg_array(ipaddr)
    set idx [lsearch $m_currlist $ipaddr]
    if {$idx != -1} {
	set m_currlist [lreplace $m_currlist $idx $idx]
    }		
    return
}

proc eval_ready_to_create {} {
    variable m_reconnect

    if {$m_reconnect == 0} {
	return 1
    }
    return 0
}

proc eval_ready_to_running {} {
    variable m_reconnect

    if {$m_reconnect} {
	return 1
    }
    return 0
}

proc eval_running_to_drain {} {
    variable m_action

    if {$m_action == "stop"} {
	return 1
    }
    return 0
}

proc eval_running_to_ready {} {
    variable m_action

    if {$m_action == "disconnect"} {
	return 1
    }
    return 0
}

proc eval_all_ipaddr_rx {} {
    variable m_currlist

    if {$m_currlist == ""} {
	return 1
    }
    return 0
}

proc act_default {} {
    variable m_ipaddrlist
    variable m_currlist

    set m_currlist $m_ipaddrlist
    return
}

proc act_ready_to_create {} {
    variable m_cmd
    variable m_filename

    act_default 
    set m_cmd "CREATE [lindex $m_filename 0] [lindex $m_filename 1]"
    return
}

proc act_create_to_enable {} {
    variable m_cmd

    act_default 
    set m_cmd "ENABLE"
    return
}

proc act_enable_to_pid {} {
    variable m_cmd

    act_default 
    set m_cmd "PID"
    return
}

proc act_pid_to_kick {} {
    variable m_cmd

    act_default 
    set m_cmd "KICK"
    return
}

proc act_running_to_drain {} {
    variable m_cmd

    act_default 
    set m_cmd "DRAIN"
    return
}

proc act_drain_to_disable {} {
    variable m_cmd

    act_default 
    set m_cmd "DISABLE"
    return
}

proc act_disable_to_close {} {
    variable m_cmd

    act_default 
    set m_cmd "CLOSE"
    return
}

proc act_to_ready {} {
    init
    return
}

proc Dump {} {
    variable m_ipaddrlist
    variable m_currlist
    variable m_cmd

    puts "ipaddrlist = $m_ipaddrlist"
    puts "currlist = $m_currlist"
    puts "current cmd = $m_cmd"
    return
}

}
