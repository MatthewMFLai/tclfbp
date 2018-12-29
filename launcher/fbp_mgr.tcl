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
    if {$resp != "DONE"} {
    	close $fd
    	return 
    }
    set m_ip_array($ipaddr) 1
    puts "$ipaddr service available"
    close $fd
    return
}

proc Sweep {start stop} {
    variable m_port
    variable m_ip_prefix
    variable m_ip_array

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
    puts $channel [list $name $size]

    fcopy $fp $channel -size $size

    close $fp
    close $channel
}

}
