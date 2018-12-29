namespace eval byList {
proc set_list {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(list:byList:list) $attr
}

proc get_list {p_generic} {
    upvar #0 $p_generic generic

    return $generic(list:byList:list)
}

proc set_crawler {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(list:byList:crawler) $attr
}

proc get_crawler {p_generic} {
    upvar #0 $p_generic generic

    return $generic(list:byList:crawler)
}

proc set_urlerror {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(list:byList:urlerror) $attr
}

proc get_urlerror {p_generic} {
    upvar #0 $p_generic generic

    return $generic(list:byList:urlerror)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(list:byList:list) ""
    set generic(list:byList:crawler) ""
    set generic(list:byList:urlerror) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(list:byList:list)
    unset generic(list:byList:crawler)
    unset generic(list:byList:urlerror)
}

proc getattrname {} {
    return "list crawler urlerror"
}
}
