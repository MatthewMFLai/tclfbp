namespace eval Blk_helper {
    variable m_name
    variable m_filepath
    variable m_ports
    variable m_node
    variable m_node_ports
    variable m_keys

proc Init {} {
    variable m_name
    variable m_filepath
    variable m_ports
    variable m_node
    variable m_node_ports
    variable m_keys

    set m_name ""
    array set m_filepath {}
    array set m_ports {}
    array set m_node {}
    array set m_node_ports {}
    set m_keys ""
    return
}

proc Parse {blkfile} {
    variable m_name
    variable m_filepath
    variable m_ports

    if {![file exists $blkfile]} {
        puts "$blkfile does not exist!"
        return
    }
   
    set compname "" 
    set fd [open $blkfile r]
    while {[gets $fd line] > -1} {
        set line [string trim $line]
        if {$line == ""} {
            continue
        }
        if {[string index $line 0] == "#"} {
            continue
        }
        switch -- [lindex $line 0] {
            name {
                set compname [lindex $line 1]
                if {[lsearch $m_name $compname] != -1} {
                    break
                }
                lappend m_name $compname
            }
            filepath {
                set m_filepath($compname) [lindex $line 1]                
            }
            inports {
                foreach token [lrange $line 1 end] {
                    set portname IN-[lindex $token 0]
                    set msgdef [lindex $token 1]
                    set m_ports($compname,$portname) $msgdef 
                }
            }
            outports {
                foreach token [lrange $line 1 end] {
                    set portname OUT-[lindex $token 0]
                    set msgdef [lindex $token 1]
                    set m_ports($compname,$portname) $msgdef 
                }
            }
            default {

            }
        }

    }
    close $fd
    return $compname 
}

proc Add_node {nodename compname} {
    variable m_name
    variable m_filepath
    variable m_ports
    variable m_node
    variable m_node_ports

    if {[lsearch $m_name $compname] == -1} {
        puts "$compname does not exist!"
        return
    }
    if {[info exist m_node($nodename)]} {
        puts "$nodename already exist!"
        return
    }

    set m_node($nodename) $compname
    return 
}

proc Add_fifo_len {nodename in_out portname key fifo_len size} {
    variable m_ports
    variable m_node
    variable m_node_ports
    variable m_keys

    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return
    }

    set compname $m_node($nodename)
    if {$in_out} {
        set port IN-$portname
    } else {
        set port OUT-$portname
    }

    if {![info exists m_ports($compname,$port)]} {
        puts "$portname does not exist!"
        return
    }

    if {![info exists m_node_ports($nodename,$port)]} {
        set m_node_ports($nodename,$port) "" 
    }
    lappend m_node_ports($nodename,$port) "$key $fifo_len $size"
 
    if {[lsearch $m_keys "$key * *"] == -1} {
        lappend m_keys "$key $fifo_len $size"
    } 
    return
}

proc Get_ports {nodename in_out} {
    variable m_name
    variable m_node
    variable m_ports

    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return
    }

    set compname $m_node($nodename)
    if {$in_out} {
        set prefix "IN"
    } else {
        set prefix "OUT"
    }
    set rc ""
    foreach token [array names m_ports "*,$prefix-*"] {
        set port [lindex [split $token ","] 1]
        regsub "$prefix-" $port "" port
        lappend rc $port
    }
    return $rc
}

proc Get_port_msgdef {nodename in_out portname} {
    variable m_name
    variable m_node
    variable m_ports

    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return
    }

    set compname $m_node($nodename)

    if {$in_out} {
        set prefix "IN"
    } else {
        set prefix "OUT"
    }

    if {![info exists m_ports($compname,$prefix-$portname)]} {
        puts "$portname does not exist in $compname"
        return
    }
    return $m_ports($compname,$prefix-$portname)
}

proc Get_fifo_len {nodename in_out portname} {
    variable m_ports
    variable m_node
    variable m_node_ports

    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return
    }

    set compname $m_node($nodename)
    if {$in_out} {
        set port IN-$portname
    } else {
        set port OUT-$portname
    }

    if {![info exists m_ports($compname,$port)]} {
        puts "$portname does not exist!"
        return
    }

    if {![info exists m_node_ports($nodename,$port)]} {
        puts "$nodename $port has no fifo set!" 
    }
    return $m_node_ports($nodename,$port)
}

proc Get_keys {} {
    variable m_keys

    return $m_keys
}

}
