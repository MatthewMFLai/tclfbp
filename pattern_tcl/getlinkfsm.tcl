proc set_state {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&state) $attr
}

proc get_state {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&state)
}

proc set_searchtext {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&searchtext) $attr
}

proc get_searchtext {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&searchtext)
}

proc set_filename {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&filename) $attr
}

proc get_filename {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&filename)
}

proc set_link {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&link) $attr
}

proc get_link {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&link)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&state) ""
    set generic(&searchtext) ""
    set generic(&filename) ""
    set generic(&link) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&state)
    unset generic(&searchtext)
    unset generic(&filename)
    unset generic(&link)
}

proc getattrname {} {
    return "state searchtext filename link"
}