proc set_query {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&query) $attr
}

proc get_query {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&query)
}

proc set_filename {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&filename) $attr
}

proc get_filename {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&filename)
}

proc set_query_rc {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&query_rc) $attr
}

proc get_query_rc {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&query_rc)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&query) ""
    set generic(&filename) ""
    set generic(&query_rc) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&query)
    unset generic(&filename)
    unset generic(&query_rc)
}

proc getattrname {} {
    return "query filename query_rc"
}