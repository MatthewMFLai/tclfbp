# Substitue <graph> with the name of the
# pattern instance.
# Substitue <vertex> and <edge> with the
# names of the application structures.
proc graph_add_edge {p_vertex_from p_vertex_to p_edge {port_from 0} {port_to 0}} {
    upvar #0 $p_vertex_from vertex_from
    upvar #0 $p_vertex_to vertex_to
    upvar #0 $p_edge edge

    set edge(&from_vertex) $p_vertex_from:$port_from
    set edge(&to_vertex) $p_vertex_to:$port_to
    lappend vertex_from(&from_edge_list) $p_edge:$port_from
    lappend vertex_to(&to_edge_list) $p_edge:$port_to
}

proc graph_remove_edge {p_vertex_from p_vertex_to p_edge {port_from 0} {port_to 0}} {
    upvar #0 $p_vertex_from vertex_from
    upvar #0 $p_vertex_to vertex_to
    upvar #0 $p_edge edge

    # Robustness checks.
    if {$edge(&from_vertex) != $p_vertex_from:$port_from} {
        return -1
    }

    if {$edge(&to_vertex) != $p_vertex_to:$port_to} {
        return -2
    }

    set edge(&from_vertex) ""
    set edge(&to_vertex) ""
    set data $vertex_from(&from_edge_list)
    set idx [lsearch $data $p_edge:$port_from]
    if {$idx > -1} {
        set vertex_from(&from_edge_list) [lreplace $data $idx $idx]
    } else {
        return -3
    }

    set data $vertex_to(&to_edge_list)
    set idx [lsearch $data $p_edge:$port_to]
    if {$idx > -1} {
        set vertex_to(&to_edge_list) [lreplace $data $idx $idx]
    } else {
        return -4
    }

    return 0
}

proc graph_get_edge {p_vertex_from p_vertex_to {port_from 0} {port_to 0}} {
    upvar #0 $p_vertex_from vertex_from

    set rc ""
    set edgelist $vertex_from(&from_edge_list)
    foreach p_edge_port $edgelist {
	# Pick edge with the port number.
	set p_edge [lindex [split $p_edge_port ":"] 0]	
	set port [lindex [split $p_edge_port ":"] 1]
	if {$port != $port_from} {
	    continue
	}	
        upvar #0 $p_edge edge
        if {$edge(&to_vertex) != $p_vertex_to:$port_to} {
            continue
        }
        lappend rc $p_edge
    }
    return $rc
}

proc graph_get_vertex_from {p_edge p_node p_port} {
    upvar #0 $p_edge edge
    upvar $p_node node
    upvar $p_port port

    set node_port $edge(&from_vertex)
    set node [lindex [split $node_port ":"] 0]
    set port [lindex [split $node_port ":"] 1]
}

proc graph_get_vertex_to {p_edge p_node p_port} {
    upvar #0 $p_edge edge
    upvar $p_node node
    upvar $p_port port

    set node_port $edge(&to_vertex)
    set node [lindex [split $node_port ":"] 0]
    set port [lindex [split $node_port ":"] 1]
}

proc graph_get_port_to {p_vertex_from port_from p_node p_port} {
    upvar #0 $p_vertex_from vertex_from
    upvar $p_node node
    upvar $p_port port

    set node ""
    set port ""
    set edgelist $vertex_from(&from_edge_list)
    foreach p_edge_port $edgelist {
	# Pick edge with the port number.
	set p_edge [lindex [split $p_edge_port ":"] 0]	
	set port [lindex [split $p_edge_port ":"] 1]
	if {$port != $port_from} {
	    continue
	}	
        upvar #0 $p_edge edge
    	set node_port $edge(&to_vertex)
    	set node [lindex [split $node_port ":"] 0]
    	set port [lindex [split $node_port ":"] 1]
	return
    }
}

proc graph_get_from_iterator {p_vertex} {
    # Return list of data in the format <vertex:port>
    upvar #0 $p_vertex vertex

    return $vertex(&from_edge_list)
}

proc graph_get_to_iterator {p_vertex} {
    # Return list of data in the format <vertex:port>
    upvar #0 $p_vertex vertex

    return $vertex(&to_edge_list)
}

proc graph_strip_port {data} {
    return [lindex [split $data ":"] 0] 
}

proc graph_get_port {data} {
    return [lindex [split $data ":"] 1] 
}

proc graph_init_edge {p_edge} {
    upvar #0 $p_edge edge
    set edge(&from_vertex) ""
    set edge(&to_vertex) ""
}

proc graph_init_vertex {p_vertex} {
    upvar #0 $p_vertex vertex
    set vertex(&from_edge_list) ""
    set vertex(&to_edge_list) ""
}
