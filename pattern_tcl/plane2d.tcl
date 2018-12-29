proc lintersect {a b} {
   foreach e $a {
        set x($e) {}
   }
   set result {}
   foreach e $b {
       if {[info exists x($e)]} {
           lappend result $e
       }
   }
   return $result
}

proc add_plane {p_vertex_1 p_vertex_2 p_plane} {
    upvar #0 $p_vertex_1 vertex_1
    upvar #0 $p_vertex_2 vertex_2
    upvar #0 $p_plane plane

    set plane(&vertex_1) $p_vertex_1
    lappend vertex_1(&plane_list) $p_plane
    set plane(&vertex_2) $p_vertex_2
    lappend vertex_2(&plane_list) $p_plane
}

proc remove_plane {p_vertex_1 p_vertex_2 p_plane} {
    upvar #0 $p_vertex_1 vertex_1
    upvar #0 $p_vertex_2 vertex_2
    upvar #0 $p_plane plane

    # Robustness checks.
    if {$plane(&vertex_1) != $p_vertex_1} {
        return -1
    }

    if {$plane(&vertex_2) != $p_vertex_2} {
        return -1
    }

    set plane(&vertex_1) ""
    set plane(&vertex_2) ""
    set data $vertex_1(&plane_list)
    set idx [lsearch $data $p_plane]
    if {$idx > -1} {
        set vertex_1(&plane_list) [lreplace $data $idx $idx]
    } else {
        return -2
    }

    set data $vertex_2(&plane_list)
    set idx [lsearch $data $p_plane]
    if {$idx > -1} {
        set vertex_2(&plane_list) [lreplace $data $idx $idx]
    } else {
        return -2
    }

    return 0
}

proc get_plane {p_vertex_1 p_vertex_2} {
    upvar #0 $p_vertex_1 vertex_1
    upvar #0 $p_vertex_2 vertex_2

    set planelist1 $vertex_1(&plane_list)
    set planelist2 $vertex_2(&plane_list)

    set rc $planelist1
    set rc [lintersect $planelist2 $rc]
    return $rc
}

proc get_vertex_1 {p_plane} {
    upvar #0 $p_plane plane

    return $plane(&vertex_1)
}

proc get_vertex_2 {p_plane} {
    upvar #0 $p_plane plane

    return $plane(&vertex_2)
}

proc get_plane_iterator {p_vertex} {
    upvar #0 $p_vertex vertex

    return $vertex(&plane_list)
}

proc init_plane {p_plane} {
   upvar #0 $p_plane plane
   set plane(&vertex_1) "" 
   set plane(&vertex_2) "" 
}

proc init_vertex {p_vertex} {
    upvar #0 $p_vertex vertex
    set vertex(&plane_list) ""
}
