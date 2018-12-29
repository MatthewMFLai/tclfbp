proc set_state {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&state) $attr
}

proc get_state {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&state)
}

proc set_symbollist {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&symbollist) $attr
}

proc get_symbollist {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&symbollist)
}

proc set_nexturl {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&nexturl) $attr
}

proc get_nexturl {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&nexturl)
}

proc set_filename {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&filename) $attr
}

proc get_filename {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&filename)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&state) ""
    set generic(&symbollist) ""
    set generic(&nexturl) ""
    set generic(&filename) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&state)
    unset generic(&symbollist)
    unset generic(&nexturl)
    unset generic(&filename)
}

proc getattrname {} {
    return "state symbollist nexturl filename"
}