proc set_list {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&list) $attr
}

proc get_list {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&list)
}

proc set_crawler {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&crawler) $attr
}

proc get_crawler {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&crawler)
}

proc set_urlerror {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&urlerror) $attr
}

proc get_urlerror {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&urlerror)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&list) ""
    set generic(&crawler) ""
    set generic(&urlerror) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&list)
    unset generic(&crawler)
    unset generic(&urlerror)
}

proc getattrname {} {
    return "list crawler urlerror"
}