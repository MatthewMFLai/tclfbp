proc set_symbol {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&symbol) $attr
}

proc get_symbol {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&symbol)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&symbol) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&symbol)
}

proc getattrname {} {
    return "symbol"
}