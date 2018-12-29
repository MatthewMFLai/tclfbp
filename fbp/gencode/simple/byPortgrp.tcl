namespace eval byPortgrp {
proc set_name {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(portgrp:byPortgrp:name) $attr
}

proc get_name {p_generic} {
    upvar #0 $p_generic generic

    return $generic(portgrp:byPortgrp:name)
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
    set generic(portgrp:byPortgrp:name) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(portgrp:byPortgrp:name)
}

proc getattrname {} {
    return "name"
}
}
