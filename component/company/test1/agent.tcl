namespace eval PortToLauncher {
    variable m_portlaunchmap

proc Init {} {
    variable m_portlaunchmap

}

proc Add {port launcher} {
    variable m_portlaunchmap

    set m_portlaunchmap($port) $launcher
    return
}

proc Get {port} {
    variable m_portlaunchmap

    if {[info exists m_portlaunchmap($port)]} { 
    	return $m_portlaunchmap($port)
    } else {
		return ""
	}
}

}

# socket server section
proc server_accept {cid addr port} {

    set launcher_obj [PortToLauncher::Get [lindex [fconfigure $cid -sockname] 2]]
    ${launcher_obj}::Add_cid $cid
    fileevent $cid readable "server_handle $cid"
    fconfigure $cid -buffering line
}

proc server_handle {cid} {

    set launcher_obj [PortToLauncher::Get [lindex [fconfigure $cid -sockname] 2]]
    if {[gets $cid request] < 0} {
		# To handle the case where the disconnect keeps firing for some
		# unknown reason.
		fileevent $cid readable ""

		${launcher_obj}::Remove_cid $cid

		if {![${launcher_obj}::Length_cid]} {
			set sd [${launcher_obj}::Get_Fbp_Mgr_Cid]
			puts $sd "[${launcher_obj}::Cmd_get] OK"
			flush $sd
		}

    } else {
		# Custom code to handle initialization.
		#
		${launcher_obj}::Handle_cid $cid $request
	}
}

# fbp mgr socket server section
proc fbp_mgr_server_accept {cid addr port} {

    fileevent $cid readable "fbp_mgr_server_handle $cid"
    fconfigure $cid -buffering line
}

proc fbp_mgr_server_handle {cid} {
	global forever env

    if {[gets $cid request] < 0} {

    } else {
		# Custom code to handle initialization.
		#
		set id [lindex $request 0]
		set cmd [lindex $request 1]
		if {$cmd == "CREATE"} {
			Launcher_Obj::Create $id 
			set launcher [Launcher_Obj::Get_Obj $id]

			set sd [socket -server server_accept 0]
			set alloc_port [lindex [fconfigure $sd -sockname] 2]
			PortToLauncher::Add $alloc_port $launcher 

			${launcher}::Init $cid
			set compdir $env(HOME)/tclfbp/component/company/test1 
			${launcher}::Setup $compdir/test.node $compdir/test.link $env(COMP_HOME)/ut_common/launcher_fsm_obj.dat $env(COMP_HOME)/ut_common/launcher_fsm_obj.tcl

			${launcher}::Execute $alloc_port

		} elseif {$cmd == "CLEANUP"} {
			set launcher [Launcher_Obj::Get_Obj $id]
			if {$launcher != ""} {
				${launcher}::Cleanup
				Key_helper::Delete_all_keys
				set sd [${launcher}::Get_Fbp_Mgr_Cid]
				namespace delete $launcher
				puts $sd "$cmd OK"
				flush $sd
			}

		} elseif {$cmd == "IDENT_AGENT"} {
			puts $cid "$cmd [pid]"
			flush $cid

		} else {
			set launcher [Launcher_Obj::Get_Obj $id]
			if {$launcher != ""} {
				${launcher}::Handle_Fbp_Mgr $cid $request
			}
		}
	}
}

load $env(TCLSHAREDMEM)/tclsharedmem[info sharedlibextension] tclsharedmem
source $env(DISK2)/sharedmem/tcl/msgdef/msgdef.tcl
source $env(DISK2)/sharedmem/tcl/blk_helper/blk_helper.tcl
source $env(DISK2)/sharedmem/tcl/key_helper/key_helper.tcl

source $env(COMP_HOME)/ut_common/launcher_factory.tcl
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl

Msgdef::Init
Blk_helper::Init
Key_helper::Init /tmp
queue_init
port_mgr_init

malloc::init
Fsm::Init

Launcher_Obj::Init $env(COMP_HOME)/ut_common/launcher_imp.tcl

set fbp_mgr_sd [socket -server fbp_mgr_server_accept 14000]

vwait forever

