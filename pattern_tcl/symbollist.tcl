proc set_symbollist {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&symbollist) $attr
}

proc get_symbollist {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&symbollist)
}

proc set_status {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&status) $attr
}

proc get_status {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&status)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&symbollist) ""
    set generic(&status) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&symbollist)
    unset generic(&status)
}

proc getattrname {} {
    return "symbollist status"
}