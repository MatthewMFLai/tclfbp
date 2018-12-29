proc set_vpi {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&vpi) $attr
}

proc get_vpi {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&vpi)
}

proc set_vci {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&vci) $attr
}

proc get_vci {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&vci)
}

proc set_vlanid {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&vlanid) $attr
}

proc get_vlanid {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&vlanid)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&vpi) ""
    set generic(&vci) ""
    set generic(&vlanid) ""
}