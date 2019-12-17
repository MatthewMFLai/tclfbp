namespace eval FbpMgr {

variable m_ip_array

proc Init {} {
    return
}

proc getipnames {} {
    variable m_ip_array
    
    return [array names m_ip_array]
}

proc get_graph_ids {p_data} {
    variable m_ip_array
    upvar $p_data data

    foreach ipname [array names m_ip_array] {
		foreach graph_id $m_ip_array($ipname) {
	    	if {![info exists data($graph_id)]} {
				set data($graph_id) ""
	    	}
	    	lappend data($graph_id) $ipname
		}
    }
    return
}

proc checkip {ipaddr port fileport} {
    variable m_ip_array

    set dot "."
    puts "scanning $ipaddr..."
    if {[catch {socket $ipaddr $port} fd]} {
    	return 
    }
	# Put in a dummy graph id for now.
    puts $fd "dummy IDENT_AGENT"
    flush $fd
    gets $fd resp
    if {[lindex $resp 0] != "IDENT_AGENT"} {
    	close $fd
    	return 
    }
    set ipname [lindex $resp 2]
    set m_ip_array($ipname) "$ipaddr $port $fileport"
    puts "$ipname $ipaddr $port $fileport service available"
    close $fd
    return
}

proc Sweep {ipaddrlist} {
    variable m_ip_array

    # Clean the ip array first.
    foreach idx [array names m_ip_array] {
		unset m_ip_array($idx)
    }

    foreach token $ipaddrlist {
		set ipaddr [lindex $token 0]
		set port [lindex $token 1] 
		set fileport [lindex $token 2] 
		checkip $ipaddr $port $fileport
    }

    return
}

proc send_one_file {name host port} {
    set size [file size $name]
    set fp [open $name r]
    fconfigure $fp -translation binary

    set channel [socket $host $port]
    fconfigure $channel -translation binary
    # Strip the directory prefix from file name.
    set idx [string last "/" $name]
    incr idx
    set filename [string range $name $idx end]
    puts $channel [list $filename $size]

    fcopy $fp $channel -size $size

    close $fp
    close $channel
}

proc bcast_send_file {filename ipnamelist} {
    variable m_ip_array

    foreach ipname $ipnamelist {
		if {![info exists m_ip_array($ipname)]} {
	    	return "$ipname not in sweep set \([array names m_ip_array]\)"
		}
		set ipaddr [lindex $m_ip_array($ipname) 0]
		set port [lindex $m_ip_array($ipname) 2]
		puts "sending $filename $ipaddr $port"
		send_one_file $filename $ipaddr $port
    }
    return "" 
}

proc get_ipaddr {ipname} {
    variable m_ip_array

	if {![info exists m_ip_array($ipname)]} {
	    return "" 
	}
    return $m_ip_array($ipname) 
}
	
}
