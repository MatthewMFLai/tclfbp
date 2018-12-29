proc set_symbol {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&symbol) $attr
}

proc get_symbol {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&symbol)
}

proc set_exchange {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&exchange) $attr
}

proc get_exchange {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&exchange)
}

proc set_roi {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&roi) $attr
}

proc get_roi {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&roi)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&symbol) ""
    set generic(&exchange) ""
    set generic(&roi) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&symbol)
    unset generic(&exchange)
    unset generic(&roi)
}

proc getattrname {} {
    return "symbol exchange roi"
}