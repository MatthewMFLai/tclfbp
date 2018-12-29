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

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&id) ""
    set generic(&socketport) ""
    set generic(&is_vport) ""
    set generic(&hostipaddr) ""
}