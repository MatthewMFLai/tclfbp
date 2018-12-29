namespace eval byFsm {
proc set_init_proc {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(fsm:byFsm:init_proc) $attr
}

proc get_init_proc {p_generic} {
    upvar #0 $p_generic generic

    return $generic(fsm:byFsm:init_proc)
}

proc set_in_service {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(fsm:byFsm:in_service) $attr
}

proc get_in_service {p_generic} {
    upvar #0 $p_generic generic

    return $generic(fsm:byFsm:in_service)
}

proc set_last_error {p_generic attr} {
    upvar #0 $p_generic generic

    set generic(fsm:byFsm:last_error) $attr
}

proc get_last_error {p_generic} {
    upvar #0 $p_generic generic

    return $generic(fsm:byFsm:last_error)
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
    set generic(fsm:byFsm:init_proc) ""
    set generic(fsm:byFsm:in_service) ""
    set generic(fsm:byFsm:last_error) ""
}

proc remove {p_generic} {
    upvar #0 $p_generic generic
    unset generic(fsm:byFsm:init_proc)
    unset generic(fsm:byFsm:in_service)
    unset generic(fsm:byFsm:last_error)
}

proc getattrname {} {
    return "init_proc in_service last_error"
}
}
