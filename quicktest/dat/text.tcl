proc set_text {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(&text) $attr
}

proc get_text {p_generic} {
    upvar #0 $p_generic generic

    return $generic(&text)
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
    set generic(&text) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(&text)
}

proc getattrname {} {
    return "text"
}