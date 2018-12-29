proc set_name {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&name) $attr
}

proc get_name {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&name)
}

proc set_is_subcircuit {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&is_subcircuit) $attr
}

proc get_is_subcircuit {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&is_subcircuit)
}

proc set_program_name {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&program_name) $attr
}

proc get_program_name {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&program_name)
}

proc set_mtc_port {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&mtc_port) $attr
}

proc get_mtc_port {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&mtc_port)
}

proc set_program_data {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&program_data) $attr
}

proc get_program_data {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&program_data)
}

proc set_program_testdata {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&program_testdata) $attr
}

proc get_program_testdata {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&program_testdata)
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(&name) ""
    set generic(&is_subcircuit) ""
    set generic(&program_name) ""
    set generic(&mtc_port) ""
    set generic(&program_data) ""
    set generic(&program_testdata) ""
}