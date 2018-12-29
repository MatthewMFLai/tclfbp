namespace eval byConnect {
# Substitue <graph> with the name of the
# pattern instance.
# Substitue <vertex> and <edge> with the
# names of the application structures.
proc graph_add_edge {p_vertex_from  p_vertex_to p_edge} {
    upvar #0 $p_vertex_from vertex_from
    upvar #0 $p_vertex_to vertex_to
    upvar #0 $p_edge edge

    set edge(graph:byConnect:from_vertex) $p_vertex_from
    set edge(graph:byConnect:to_vertex) $p_vertex_to
    lappend vertex_from(graph:byConnect:from_edge_list) $p_edge
    lappend vertex_to(graph:byConnect:to_edge_list) $p_edge
}

proc graph_remove_edge {p_vertex_from p_vertex_to p_edge} {
    upvar #0 $p_vertex_from vertex_from
    upvar #0 $p_vertex_to vertex_to
    upvar #0 $p_edge edge

    # Robustness checks.
    if {$edge(graph:byConnect:from_vertex) != $p_vertex_from} {
        return -1
    }

    if {$edge(graph:byConnect:to_vertex) != $p_vertex_to} {
        return -2
    }

    set edge(graph:byConnect:from_vertex) ""
    set edge(graph:byConnect:to_vertex) ""
    set data $vertex_from(graph:byConnect:from_edge_list)
    set idx [lsearch $data $p_edge]
    if {$idx > -1} {
        set vertex_from(graph:byConnect:from_edge_list) [lreplace $data $idx $idx]
    } else {
        return -3
    }

    set data $vertex_to(graph:byConnect:to_edge_list)
    set idx [lsearch $data $p_edge]
    if {$idx > -1} {
        set vertex_to(graph:byConnect:to_edge_list) [lreplace $data $idx $idx]
    } else {
        return -4
    }

    return 0
}

proc graph_get_edge {p_vertex_from p_vertex_to} {
    upvar #0 $p_vertex_from vertex_from

    set rc ""
    set edgelist $vertex_from(graph:byConnect:from_edge_list)
    foreach p_edge $edgelist {
        upvar #0 $p_edge edge
        if {$edge(graph:byConnect:to_vertex) != $p_vertex_to} {
            continue
        }
        lappend rc $p_edge
    }
    return $rc
}

proc graph_get_vertex_from {p_edge} {
    upvar #0 $p_edge edge

    return $edge(graph:byConnect:from_vertex)
}

proc graph_get_vertex_to {p_edge} {
    upvar #0 $p_edge edge

    return $edge(graph:byConnect:to_vertex)
}

proc graph_get_from_iterator {p_vertex} {
    upvar #0 $p_vertex vertex

    return $vertex(graph:byConnect:from_edge_list)
}

proc graph_get_to_iterator {p_vertex} {
    upvar #0 $p_vertex vertex

    return $vertex(graph:byConnect:to_edge_list)
}

proc graph_init_edge {p_edge} {
    upvar #0 $p_edge edge
    set edge(graph:byConnect:from_vertex) ""
    set edge(graph:byConnect:to_vertex) ""
}

proc graph_init_vertex {p_vertex} {
    upvar #0 $p_vertex vertex
    set vertex(graph:byConnect:from_edge_list) ""
    set vertex(graph:byConnect:to_edge_list) ""
}

}
