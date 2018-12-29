proc set_group {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&group) $attr
}

proc get_group {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&group)
}

proc set_page {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&page) $attr
}

proc get_page {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&page)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&group) ""
    set generic(&page) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&group)
    unset generic(&page)
}

proc getattrname {} {
    return "group page"
}