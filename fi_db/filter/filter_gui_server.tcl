proc server_accept_usrif {cid addr port} {
    global g_usrif_channels

    fileevent $cid readable "server_handle_usrif $cid"
    #fconfigure $cid -buffering line -translation binary
    fconfigure $cid -buffering line
}

proc server_handle_usrif {cid} {
    global g_usrif_channels

    if {[gets $cid request] < 0} {
        close $cid
	foreach name [array names g_usrif_channels] {
	    if {$g_usrif_channels($name) == $cid} {
	    	unset g_usrif_channels($name)
		break
	    }
	}
	
    } else {
        # Custom code to handle request
        #
	array set data $request
	if {[info exists data(id)]} {
	    set name $data(id)
	    set g_usrif_channels($name) $cid
	    # Send ack back to client.
	    catch {puts $cid "SERVER_ACK"}
	    flush $cid
	} else {
	    # Do not recognize message. Just drop it.
	    catch {puts $cid "SERVER_NACK"}
	}
    }
}

proc server_get {} {
    global g_usrif_channels

    return [array names g_usrif_channels]
}

proc server_send {namelist symbollist} {
    global g_usrif_channels

    foreach name $namelist {
	if {![info exists g_usrif_channels($name)]} {
	    continue
	}
	catch {puts $g_usrif_channels($name) $symbollist; flush}
    }
    return
}

proc set_usrif {usrif_port} {
    global g_usrif_channels
    global g_server_port

    # Create channel array if not already done before.
    array set g_usrif_channels {}
    # Clear current cids if they exist.
    foreach name [array names g_usrif_channels] {
	catch {close $g_usrif_channels($name)}
	unset g_usrif_channels($name)
    }
    set g_server_port $usrif_port
    socket -server server_accept_usrif $g_server_port
}

proc check_usrif {} {
    global g_server_port

    return $g_server_port
}

proc init_usrif {} {
    global g_usrif_channels
    global g_server_port

    if {[info exists g_usrif_channels]} {
        unset g_usrif_channels
    }
    array set g_usrif_channels {}
    set g_server_port 0

    return
}
