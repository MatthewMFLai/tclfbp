proc set_state {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&state) $attr
}

proc get_state {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&state)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&state) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&state)
}

proc getattrname {} {
    return "state"
}