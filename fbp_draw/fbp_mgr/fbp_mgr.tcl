namespace eval FbpMgr {

variable m_port
variable m_ip_prefix
variable m_ip_array

proc Init {ip_prefix port} {
    variable m_port
    variable m_ip_prefix

    set m_port $port
    set m_ip_prefix $ip_prefix
    return
}

proc getip {} {
    variable m_ip_array
    
    return [array names m_ip_array]
}

proc get_graph_ids {p_data} {
    variable m_ip_array
    upvar $p_data data

    foreach ipaddr [array names m_ip_array] {
	foreach graph_id $m_ip_array($ipaddr) {
	    if {![info exists data($graph_id)]} {
		set data($graph_id) ""
	    }	
	    lappend data($graph_id) $ipaddr
	}
    }
    return
}

proc checkip {ipaddr port} {
    variable m_ip_array

    set dot "."
    puts "scanning $ipaddr..."
    if {[catch {socket $ipaddr $port} fd]} {
    	return 
    }
    puts $fd "IDENT $ipaddr"
    flush $fd
    gets $fd resp
    if {[lindex $resp 0] != "DONE"} {
     # if {$resp != "DONE"} 
    	close $fd
    	return 
    }
    set m_ip_array($ipaddr) [lindex $resp 1]
    puts "$ipaddr service available"
    close $fd
    return
}

proc Sweep {start stop} {
    variable m_port
    variable m_ip_prefix
    variable m_ip_array

    # Clean the ip array first.
    foreach idx [array names m_ip_array] {
	unset m_ip_array($idx)
    }

    set dot "."
    for {set i $start} {$i < $stop} {incr i} {
	set ipaddr $m_ip_prefix$dot$i
	checkip $ipaddr $m_port
    }

    # Check localhost if ip array is empty.
    if {[array names m_ip_array] == ""} {
	checkip "localhost" $m_port
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

proc bcast_send_file {filename ipaddrlist port} {
    variable m_ip_array

    foreach ipaddr $ipaddrlist {
	if {![info exists m_ip_array($ipaddr)]} {
	    return "$ipaddr not in sweep set \([array names m_ip_array]\)"
	}
	puts "sending $filename $ipaddr $port"
	send_one_file $filename $ipaddr $port
    }
    return "" 
}
	
}
