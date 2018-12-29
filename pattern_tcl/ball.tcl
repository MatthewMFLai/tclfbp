proc set_BALL {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&BALL) $attr
}

proc get_BALL {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&BALL)
}

proc set_msg {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&msg) $attr
}

proc get_msg {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&msg)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&BALL) ""
    set generic(&msg) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&BALL)
    unset generic(&msg)
}

proc getattrname {} {
    return "BALL msg"
}