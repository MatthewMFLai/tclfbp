# Substitue <triangle> with the name of the
# pattern instance.
# Substitue <vertex> and <plane> with the
# names of the application structures.
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

proc triangle_add_plane {p_vertex_1  p_vertex_2 p_vertex_3 p_plane} {
    upvar #0 $p_vertex_1 vertex_1
    upvar #0 $p_vertex_2 vertex_2
    upvar #0 $p_vertex_3 vertex_3
    upvar #0 $p_plane plane

    set plane(&vertex_1) $p_vertex_1
    set plane(&vertex_2) $p_vertex_2
    set plane(&vertex_3) $p_vertex_3
    lappend vertex_1(&plane_1_list) $p_plane
    lappend vertex_2(&plane_2_list) $p_plane
    lappend vertex_3(&plane_3_list) $p_plane
}

proc triangle_remove_plane {p_vertex_1 p_vertex_2 p_vertex_3 p_plane} {
    upvar #0 $p_vertex_1_vertex_1
    upvar #0 $p_vertex_2 vertex_2
    upvar #0 $p_vertex_3 vertex_3
    upvar #0 $p_plane plane

    # Robustness checks.
    if {$plane(&vertex_1) != $p_vertex_1} {
        return -1
    }

    if {$plane(&vertex_2) != $p_vertex_2} {
        return -1
    }

    if {$plane(&vertex_3) != $p_vertex_3} {
        return -1
    }

    set plane(&vertex_1) ""
    set plane(&vertex_2) ""
    set plane(&vertex_3) ""
    set data $vertex_1(&plane_1_list)
    set idx [lsearch $data $p_plane]
    if {$idx > -1} {
        set vertex_1(&plane_1_list) [lreplace $data $idx $idx]
    } else {
        return -2
    }

    set data $vertex_2(&plane_2_list)
    set idx [lsearch $data $p_plane]
    if {$idx > -1} {
        set vertex_2(&plane_2_list) [lreplace $data $idx $idx]
    } else {
        return -2
    }

    set data $vertex_3(&plane_3_list)
    set idx [lsearch $data $p_plane]
    if {$idx > -1} {
        set vertex_3(&plane_3_list) [lreplace $data $idx $idx]
    } else {
        return -2
    }

    return 0
}

proc triangle_get_plane {p_vertex_1 p_vertex_2 p_vertex_3} {
    upvar #0 $p_vertex_1 vertex_1
    upvar #0 $p_vertex_2 vertex_2
    upvar #0 $p_vertex_3 vertex_3

    set planelist1 $vertex_1(&plane_1_list)
    set planelist2 $vertex_2(&plane_2_list)
    set planelist3 $vertex_3(&plane_3_list)

    set rc $planelist1
    set rc [lintersect $planelist2 $rc]
    set rc [lintersect $planelist3 $rc]
    return $rc 
}

proc triangle_get_vertex_1 {p_plane} {
    upvar #0 $p_plane plane

    return $plane(&vertex_1)
}

proc triangle_get_vertex_2 {p_plane} {
    upvar #0 $p_plane plane

    return $plane(&vertex_2)
}

proc triangle_get_vertex_3 {p_plane} {
    upvar #0 $p_plane plane

    return $plane(&vertex_3)
}

proc triangle_get_plane_1_iterator {p_vertex} {
    upvar #0 $p_vertex vertex

    return $vertex(&plane_1_list)
}

proc triangle_get_plane_2_iterator {p_vertex} {
    upvar #0 $p_vertex vertex

    return $vertex(&plane_2_list)
}

proc triangle_get_plane_3_iterator {p_vertex} {
    upvar #0 $p_vertex vertex

    return $vertex(&plane_3_list)
}

proc triangle_init_plane {p_plane} {
    upvar #0 $p_plane plane
    set plane(&vertex_1) ""
    set plane(&vertex_2) ""
    set plane(&vertex_3) ""
}

proc triangle_init_vertex {p_vertex} {
    upvar #0 $p_vertex vertex
    set vertex(&plane_1_list) ""
    set vertex(&plane_2_list) ""
    set vertex(&plane_3_list) ""
}
