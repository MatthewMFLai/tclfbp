proc set_group {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&group) $attr
}

proc get_group {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&group)
}

proc set_exchange {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&exchange) $attr
}

proc get_exchange {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&exchange)
}

proc set_symbollist {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&symbollist) $attr
}

proc get_symbollist {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&symbollist)
}

proc set_url {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&url) $attr
}

proc get_url {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&url)
}

proc set_nexturl {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&nexturl) $attr
}

proc get_nexturl {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&nexturl)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&group) ""
    set generic(&exchange) ""
    set generic(&symbollist) ""
    set generic(&url) ""
    set generic(&nexturl) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&group)
    unset generic(&exchange)
    unset generic(&symbollist)
    unset generic(&url)
    unset generic(&nexturl)
}

proc getattrname {} {
    return "group exchange symbollist url nexturl"
}