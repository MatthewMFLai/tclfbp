namespace eval byNode {
proc set_process_proc {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(node:byNode:process_proc) $attr
}

proc get_process_proc {p_generic} {
    upvar #0 $p_generic generic

    return $generic(node:byNode:process_proc)
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
    set generic(node:byNode:process_proc) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(node:byNode:process_proc)
}

proc getattrname {} {
    return "process_proc"
}
}
