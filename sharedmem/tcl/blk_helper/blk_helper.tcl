namespace eval Blk_helper {
    variable m_name
    variable m_msg_null
    variable m_filepath
    variable m_ports
    variable m_reflected_ports
    variable m_node
    variable m_node_desc
    variable m_node_ports
    variable m_keys
	variable m_tx_data
	variable m_rx_data

proc Init {msg_null} {
    variable m_name
    variable m_msg_null
    variable m_filepath
    variable m_ports
    variable m_reflected_ports
    variable m_node
    variable m_node_desc
    variable m_node_ports
    variable m_keys
	variable m_tx_data
	variable m_rx_data

    set m_name ""
	set m_msg_null $msg_null
    array set m_filepath {}
    array set m_ports {}
    array set m_reflected_ports {}
    array set m_node {}
    array set m_node_desc {}
    array set m_node_ports {}
    array set m_keys {} 
    array set m_tx_data {} 
    array set m_rx_data {} 
    return
}

proc Clean {id} {
    variable m_node
    variable m_node_desc
    variable m_node_ports
    variable m_reflected_ports
    variable m_keys
	variable m_tx_data
	variable m_rx_data

	if {[info exists m_keys($id)]} {
		unset m_keys($id)
	}

	foreach nodename [array names m_node "$id-*"] {
		unset m_node($nodename)
	}

	foreach nodename [array names m_node_desc "$id-*"] {
		unset m_node_desc($nodename)
	}

	foreach idx [array names m_node_ports "$id-*"] {
		unset m_node_ports($idx)
	}

	foreach idx [array names m_reflected_ports "$id-*"] {
		unset m_reflected_ports($idx)
	}

	foreach idx [array names m_tx_data "$id-*"] {
		unset m_tx_data($idx)
	}

	foreach idx [array names m_rx_data "$id-*"] {
		unset m_rx_data($idx)
	}

	return
}

proc Parse {blkfile} {
    global env
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
                set m_filepath($compname) [subst [lindex $line 1]]
            }
            inports {
                foreach token [lrange $line 1 end] {
                    set portname IN-[lindex $token 0]
                    set msgdef [subst [lindex $token 1]]
                    set m_ports($compname,$portname) $msgdef 
                }
            }
            outports {
                foreach token [lrange $line 1 end] {
                    set portname OUT-[lindex $token 0]
                    set msgdef [subst [lindex $token 1]]
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

proc Add_node {id nodename compname desc} {
    variable m_name
    variable m_filepath
    variable m_node
    variable m_node_desc

	set nodename $id-$nodename
    if {[lsearch $m_name $compname] == -1} {
        puts "$compname does not exist!"
        return
    }
    if {[info exist m_node($nodename)]} {
        puts "$nodename already exist!"
        return
    }

    set m_node($nodename) $compname
    set m_node_desc($nodename) $desc
    return 
}

proc Add_fifo_len {id nodename in_out portname key fifo_len size} {
    variable m_ports
    variable m_node
    variable m_node_ports
    variable m_keys

	set nodename $id-$nodename
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

    if {![info exists m_keys($id)]} {
        set m_keys($id) ""
    }
    if {[lsearch $m_keys($id) "$key * *"] == -1} {
        lappend m_keys($id) "$key $fifo_len $size"
    } 
    return
}

proc Add_reflected_port {id nodename in_out portname msgname} {
    variable m_node
    variable m_reflected_ports

	set nodename $id-$nodename
    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return
    }

    if {$in_out} {
        set port IN-$portname
    } else {
        set port OUT-$portname
    }

    set m_reflected_ports($nodename,$port) $msgname
    return
}

proc Get_reflected_port {nodename portname} {
    variable m_node
    variable m_reflected_ports

    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return ""
    }

    if {![info exists m_reflected_ports($nodename,$portname)]} {
        puts "No reflected port msgdef for $nodename $portname"
		return ""
	} else {
		return $m_reflected_ports($nodename,$portname)
	}
    return
}

proc Add_tx_data {id nodename data} {
	variable m_node
	variable m_tx_data

	set nodename $id-$nodename
    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return
    }
	set m_tx_data($nodename) $data
	return
}

proc Add_rx_data {id nodename data} {
	variable m_node
	variable m_rx_data

	set nodename $id-$nodename
    if {![info exists m_node($nodename)]} {
        puts "$nodename does not exist!"
        return
    }
	set m_rx_data($nodename) $data
	return
}

proc Get_rx_data {id} {
	variable m_rx_data

	set rc ""
	foreach nodename [array names m_rx_data "$id-*"] {
		lappend rc $m_rx_data($nodename)
	}	
	return $rc
}

proc Find_node {id nodename desc} {
    variable m_name
    variable m_filepath
    variable m_node
	variable m_node_desc

	set nodename $id-$nodename
    if {[info exist m_node($nodename)] && [info exist m_node_desc($nodename)]} {
		if {$m_node_desc($nodename) == $desc} {
        	return 1
		} else {
			return 0
		}
    } else {
		return 0
	}
}

proc Get_ports {id nodename in_out} {
    variable m_name
    variable m_node
    variable m_ports

	set nodename $id-$nodename
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

proc Get_port_msgdef {id nodename in_out portname} {
    variable m_name
    variable m_node
    variable m_ports

	set nodename $id-$nodename
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

proc Get_fifo_len {id nodename in_out portname} {
    variable m_ports
    variable m_node
    variable m_node_ports

	set nodename $id-$nodename
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

proc Get_keys {id} {
    variable m_keys

	if {[info exists m_keys($id)]} {	
    	return $m_keys($id)
	} else {
		return ""
	}
}

proc Gen_str {nodename} {
# Generate inports, outports and app string that looks like these:
#exec tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $env(MSGDEF_HOME)/test/test0.msg:$key1:4 OUT-1 $env(MSGDEF_HOME)/test/test0.msg:$key2:4 PROGRAM $env(DISK2)/sharedmem/tcl/test2.tcl RUNNING 0 &
#exec tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $env(MSGDEF_HOME)/test/test0.msg:$key2:4 OUT-1 $env(MSGDEF_HOME)/test/test0.msg:$key1:4 PROGRAM $env(DISK2)/sharedmem/tcl/test2.tcl RUNNING 0 &

    variable m_name
    variable m_msg_null
    variable m_filepath
    variable m_ports
    variable m_reflected_ports
    variable m_node
    variable m_node_ports

    set rc ""
    if {![info exists m_node($nodename)]} {
        return $rc
    } 
    set compname $m_node($nodename)
    
    set inports ""
    foreach idx [array names m_node_ports "$nodename,IN-*"] {
        lappend inports [lindex [split $idx ","] 1]
    }

    set outports ""
    foreach idx [array names m_node_ports "$nodename,OUT-*"] {
        lappend outports [lindex [split $idx ","] 1]
    }

    foreach port $inports {
        append rc $port
        append rc " "

        set msgdef $m_ports($compname,$port)
		if {[string first $m_msg_null $msgdef] == -1} {
        	append rc $msgdef
		} else {
			append rc [Get_reflected_port $nodename $port]
		}

        foreach keydata $m_node_ports($nodename,$port) { 
        	append rc ":"
        	append rc [lindex $keydata 0]
        	append rc ":"
        	append rc [lindex $keydata 1]
		}
        append rc " "
    }
    foreach port $outports {
        append rc $port
        append rc " "

        set msgdef $m_ports($compname,$port)
		if {[string first $m_msg_null $msgdef] == -1} {
        	append rc $msgdef
		} else {
			append rc [Get_reflected_port $nodename $port]
		}

        append rc ":"
        set keydata [lindex $m_node_ports($nodename,$port) 0]
        append rc [lindex $keydata 0]
        append rc ":"
        append rc [lindex $keydata 1]
        append rc " "
    }
 
    append rc "PROGRAM $m_filepath($compname)/$compname.tcl" 
    return $rc
}

proc gen_sock_str {id nodename alloc_port} {
	variable m_node
	variable m_tx_data
	variable m_node_ports
	global env

	set cmd ""
	set port "IN-1"

	if {![info exists m_tx_data($nodename)]} {
		return $cmd
	}

    if {![info exists m_node_ports($nodename,$port)]} {
		return $cmd
    }

    set token [lindex $m_node_ports($nodename,$port) 0]
	set key [lindex $token 0]
	set fifo_len [lindex $token 1]
	set size [lindex $token 2]
	set to_data $m_tx_data($nodename)
	set to_ip [lindex [split $to_data ":"] 0]
	set to_port [lindex [split $to_data ":"] 1]
    set cmd "exec tclsh $env(COMP_HOME)/2.0/sock_node/sock_node_tx.tcl BLOCK $nodename INIT localhost:$alloc_port GRAPH_ID $id "
	append cmd "IN-1 \"null.msg:$key:$fifo_len:$size\" "
	append cmd "TX_DATA \"localhost:0:$to_ip:$to_port\" &"

	return $cmd
}
	
proc Get_Exec_Cmds {id alloc_port desc} {
	variable m_node
	variable m_node_desc
	variable m_tx_data
	variable m_rx_data
	global env

	if {[array names m_tx_data] != ""} {
		puts "Dump tx data"
		puts [array get m_tx_data]
	}	
	if {[array names m_rx_data] != ""} {
		puts "Dump rx data"
		puts [array get m_rx_data]
	}

	set rc ""
	foreach nodename [Get_nodes $id] {
		if {$m_node_desc($nodename) != $desc} {
			continue
		}	
		if {[info exists m_rx_data($nodename)]} {
			continue
		}
		if {[info exists m_tx_data($nodename)]} {
			lappend rc [gen_sock_str $id $nodename $alloc_port]
			continue
		}
    	set cmd "exec tclsh $env(DISK2)/sharedmem/tcl/node/node.tcl BLOCK $nodename INIT localhost:$alloc_port "
    	append cmd [Blk_helper::Gen_str $nodename]
    	append cmd " RUNNING 0 &"
		lappend rc $cmd
	}
	return $rc
}

proc Get_nodes {id} {
    variable m_node

    return [array names m_node "$id-*"]
}

proc Dump {} {
    variable m_name
    variable m_filepath
    variable m_ports
    variable m_node
    variable m_node_ports
    variable m_keys

    puts "Components:"
    puts $m_name
    puts ""
 
    puts "Component filepath:"
    foreach idx [array names m_filepath] {
        puts "$idx $m_filepath($idx)"
    }
    puts ""

    puts "Ports:"
    foreach idx [array names m_ports] {
        puts "$idx $m_ports($idx)"
    }
    puts ""

    puts "Nodes:"
    foreach idx [array names m_node] {
        puts "$idx $m_node($idx)"
    }
    puts ""

    puts "Node ports:"
    foreach idx [array names m_node_ports] {
        puts "$idx $m_node_ports($idx)"
    }
    puts ""

    puts "Keys:"
	foreach id [array names m_keys] {
		puts "ID: $id"
    	foreach token $m_keys($id) {
        	puts "[lindex $token 0] [lindex $token 1] [lindex $token 2]"
    	}
	}
    return
}

}
