proc set_id {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&id) $attr
}

proc get_id {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&id)
}

proc set_socketport {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&socketport) $attr
}

proc get_socketport {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&socketport)
}

proc set_is_vport {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&is_vport) $attr
}

proc get_is_vport {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&is_vport)
}

proc set_hostipaddr {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&hostipaddr) $attr
}

proc get_hostipaddr {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&hostipaddr)
}

proc set_queuelen {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&queuelen) $attr
}

proc get_queuelen {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&queuelen)
}

proc set_def_grp_status {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&def_grp_status) $attr
}

proc get_def_grp_status {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&def_grp_status)
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
    set generic(&id) ""
    set generic(&socketport) ""
    set generic(&is_vport) ""
    set generic(&hostipaddr) ""
    set generic(&queuelen) ""
    set generic(&def_grp_status) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&id)
    unset generic(&socketport)
    unset generic(&is_vport)
    unset generic(&hostipaddr)
    unset generic(&queuelen)
    unset generic(&def_grp_status)
}

proc getattrname {} {
    return "id socketport is_vport hostipaddr queuelen def_grp_status"
}