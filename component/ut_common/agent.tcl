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
    global g_data

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

			${launcher}::Setup $id $g_data(ip) $g_data(workdir)/$id.node $g_data(workdir)/$id.link $env(COMP_HOME)/ut_common/launcher_fsm_obj.dat $env(COMP_HOME)/ut_common/launcher_fsm_obj.tcl
			file delete $g_data(workdir)/$id.node
			file delete $g_data(workdir)/$id.link
			${launcher}::Execute $id $alloc_port

		} elseif {$cmd == "CLEANUP"} {
			set launcher [Launcher_Obj::Get_Obj $id]
			if {$launcher != ""} {
				${launcher}::Cleanup $id
				Blk_helper::Clean $id
				Key_helper::Delete_all_keys $id
				set sd [${launcher}::Get_Fbp_Mgr_Cid]
				Launcher_Obj::Delete $id
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

#-----------------------------------------------------------
# File receive utility
#
proc receive_file {channel_name client_address client_port} {
    global g_data

    fconfigure $channel_name -translation binary
    gets $channel_name line
    foreach {name size} $line {}

    set fully_qualified_filename [file join $g_data(workdir) $name]
    set fp [open $fully_qualified_filename w]
    fconfigure $fp -translation binary

    fcopy $channel_name $fp -size $size

    close $channel_name
    close $fp
}
#-----------------------------------------------------------
# sock_node_rx handler
#
# sock_node_rx_accept --
#	Accept a connection from sock_node_rx daemon.
#
# Arguments:
#	sock	The new socket connection to sock_node_rx 
#	addr	The client's IP address
#	port	The client's port number
	
proc sock_node_rx_accept {sock addr port} {
    global g_data

    set g_data(sock_node_rx) $sock 

    # Ensure that each "puts" by the server
    # results in a network transmission

    fconfigure $sock -buffering line

    # Set up a callback for when the client sends data

    fileevent $sock readable [list sock_node_rx_handle $sock]
}

# sock_node_rx_handle --
#	This procedure is called when the server
#	can read data from the sock_node_rx 
#
# Arguments:
#	sock	The socket connection to the sock_node_rx 

proc sock_node_rx_handle {sock} {
	global g_data

    # Check end of file or abnormal connection drop,
    # then echo data back to the client.

    if {[eof $sock] || [catch {gets $sock resp}]} {
		close $sock
    } else {
		if {$resp == "sock rx connected"} {
			# log the response?
		} else {
			set cmd [lindex $resp 0]
			set id [lindex $resp 1]
			set rc [lindex $resp 2]
			if {$cmd == "KEYS" && $rc == "OK"} {
				set launcher [Launcher_Obj::Get_Obj $id]
				${launcher}::Set_sock_node_rx_ack
			} elseif {$cmd == "KEYS_REMOVE" && $rc == "OK"} {

			}
		}
        #
        #
        #
    }
}

proc sock_node_rx_send_keys {id keydatalist} {
	global g_data

	# keydatalist looks like 
	# "key:size:fifo_len key:size:fifo_len ..."
	set cmd [list KEYS $id $keydatalist]
    puts $g_data(sock_node_rx) $cmd
	return
}

proc sock_node_rx_send_keys_delete {id keydatalist} {
	global g_data

	# keydatalist looks like 
	# "key:size:fifo_len key:size:fifo_len ..."
	set cmd [list KEYS_REMOVE $id $keydatalist]
    puts $g_data(sock_node_rx) $cmd
	return
}
#-----------------------------------------------------------
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

array set g_data {}
set g_data(workdir) $env(DISK2)/scratchpad
set g_data(ip) "localhost"
set g_data(sock_node_rx) ""
 
socket -server fbp_mgr_server_accept 14000
socket -server receive_file 14001 
socket -server sock_node_rx_accept 14002

vwait forever

