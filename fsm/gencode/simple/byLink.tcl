namespace eval byLink {
proc set_eval_proc {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(link:byLink:eval_proc) $attr
}

proc get_eval_proc {p_generic} {
    upvar #0 $p_generic generic

    return $generic(link:byLink:eval_proc)
}

proc set_action_proc {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(link:byLink:action_proc) $attr
}

proc get_action_proc {p_generic} {
    upvar #0 $p_generic generic

    return $generic(link:byLink:action_proc)
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
    set generic(link:byLink:eval_proc) ""
    set generic(link:byLink:action_proc) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(link:byLink:eval_proc)
    unset generic(link:byLink:action_proc)
}

proc getattrname {} {
    return "eval_proc action_proc"
}
}
