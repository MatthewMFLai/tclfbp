proc set_is_function {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&is_function) $attr
}

proc get_is_function {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&is_function)
}

proc set_is_bss {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&is_bss) $attr
}

proc get_is_bss {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&is_bss)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&is_function) ""
    set generic(&is_bss) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&is_function)
    unset generic(&is_bss)
}

proc getattrname {} {
    return "is_function is_bss"
}