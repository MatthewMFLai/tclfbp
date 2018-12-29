namespace eval byBlock {
proc set_name {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:name) $attr
}

proc get_name {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:name)
}

proc set_is_subcircuit {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:is_subcircuit) $attr
}

proc get_is_subcircuit {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:is_subcircuit)
}

proc set_program_name {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:program_name) $attr
}

proc get_program_name {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:program_name)
}

proc set_mtc_port {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:mtc_port) $attr
}

proc get_mtc_port {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:mtc_port)
}

proc set_program_data {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:program_data) $attr
}

proc get_program_data {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:program_data)
}

proc set_program_testdata {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:program_testdata) $attr
}

proc get_program_testdata {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:program_testdata)
}

proc set_ip_addr {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:ip_addr) $attr
}

proc get_ip_addr {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:ip_addr)
}

proc set_timeout {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(block:byBlock:timeout) $attr
}

proc get_timeout {p_generic} {
    upvar #0 $p_generic generic

    return $generic(block:byBlock:timeout)
}

proc set_all {p_generic p_data} {
    upvar $p_data data

    set attrlist [getattrname]
    foreach attr [array names data] {
        if {[lsearch $attrlist $attr] > -1} {
           set_$attr $p_generic $data($attr)
        }
    }
    return
}

proc init {p_generic} {
    upvar #0 $p_generic generic
    set generic(block:byBlock:name) ""
    set generic(block:byBlock:is_subcircuit) ""
    set generic(block:byBlock:program_name) ""
    set generic(block:byBlock:mtc_port) ""
    set generic(block:byBlock:program_data) ""
    set generic(block:byBlock:program_testdata) ""
    set generic(block:byBlock:ip_addr) ""
    set generic(block:byBlock:timeout) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(block:byBlock:name)
    unset generic(block:byBlock:is_subcircuit)
    unset generic(block:byBlock:program_name)
    unset generic(block:byBlock:mtc_port)
    unset generic(block:byBlock:program_data)
    unset generic(block:byBlock:program_testdata)
    unset generic(block:byBlock:ip_addr)
    unset generic(block:byBlock:timeout)
}

proc getattrname {} {
    return "name is_subcircuit program_name mtc_port program_data program_testdata ip_addr timeout"
}
}
