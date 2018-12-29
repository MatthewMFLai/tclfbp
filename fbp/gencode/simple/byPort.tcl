namespace eval byPort {
proc set_id {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(port:byPort:id) $attr
}

proc get_id {p_generic} {
    upvar #0 $p_generic generic

    return $generic(port:byPort:id)
}

proc set_socketport {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(port:byPort:socketport) $attr
}

proc get_socketport {p_generic} {
    upvar #0 $p_generic generic

    return $generic(port:byPort:socketport)
}

proc set_is_vport {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(port:byPort:is_vport) $attr
}

proc get_is_vport {p_generic} {
    upvar #0 $p_generic generic

    return $generic(port:byPort:is_vport)
}

proc set_hostipaddr {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(port:byPort:hostipaddr) $attr
}

proc get_hostipaddr {p_generic} {
    upvar #0 $p_generic generic

    return $generic(port:byPort:hostipaddr)
}

proc set_queuelen {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(port:byPort:queuelen) $attr
}

proc get_queuelen {p_generic} {
    upvar #0 $p_generic generic

    return $generic(port:byPort:queuelen)
}

proc set_def_grp_status {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(port:byPort:def_grp_status) $attr
}

proc get_def_grp_status {p_generic} {
    upvar #0 $p_generic generic

    return $generic(port:byPort:def_grp_status)
}

proc set_all {p_generic p_data} {
    upvar $p_data data

    set attrlist [getattrname]
    foreach attr [array names data] {
        if {[lsearch $attrlist $attr] > -1} {
           set_$attr $p_generic $data($attr)
        }
    }
    return
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(port:byPort:id) ""
    set generic(port:byPort:socketport) ""
    set generic(port:byPort:is_vport) ""
    set generic(port:byPort:hostipaddr) ""
    set generic(port:byPort:queuelen) ""
    set generic(port:byPort:def_grp_status) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(port:byPort:id)
    unset generic(port:byPort:socketport)
    unset generic(port:byPort:is_vport)
    unset generic(port:byPort:hostipaddr)
    unset generic(port:byPort:queuelen)
    unset generic(port:byPort:def_grp_status)
}

proc getattrname {} {
    return "id socketport is_vport hostipaddr queuelen def_grp_status"
}
}
