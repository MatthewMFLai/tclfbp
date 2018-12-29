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

proc set_ip_addr {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&ip_addr) $attr
}

proc get_ip_addr {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&ip_addr)
}

proc set_timeout {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&timeout) $attr
}

proc get_timeout {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&timeout)
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
    set generic(&name) ""
    set generic(&is_subcircuit) ""
    set generic(&program_name) ""
    set generic(&mtc_port) ""
    set generic(&program_data) ""
    set generic(&program_testdata) ""
    set generic(&ip_addr) ""
    set generic(&timeout) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&name)
    unset generic(&is_subcircuit)
    unset generic(&program_name)
    unset generic(&mtc_port)
    unset generic(&program_data)
    unset generic(&program_testdata)
    unset generic(&ip_addr)
    unset generic(&timeout)
}

proc getattrname {} {
    return "name is_subcircuit program_name mtc_port program_data program_testdata ip_addr timeout"
}