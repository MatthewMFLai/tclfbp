namespace eval byGroup {
proc set_group {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(group:byGroup:group) $attr
}

proc get_group {p_generic} {
    upvar #0 $p_generic generic

    return $generic(group:byGroup:group)
}

proc set_page {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(group:byGroup:page) $attr
}

proc get_page {p_generic} {
    upvar #0 $p_generic generic

    return $generic(group:byGroup:page)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(group:byGroup:group) ""
    set generic(group:byGroup:page) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(group:byGroup:group)
    unset generic(group:byGroup:page)
}

proc getattrname {} {
    return "group page"
}
}
