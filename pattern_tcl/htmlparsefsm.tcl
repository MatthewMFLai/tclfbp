proc set_fsm_name {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&fsm_name) $attr
}

proc get_fsm_name {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&fsm_name)
}

proc set_pattern_name {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&pattern_name) $attr
}

proc get_pattern_name {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&pattern_name)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&fsm_name) ""
    set generic(&pattern_name) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&fsm_name)
    unset generic(&pattern_name)
}

proc getattrname {} {
    return "fsm_name pattern_name"
}