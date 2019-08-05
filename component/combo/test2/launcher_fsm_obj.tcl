namespace eval OBJNAME_FSM {

proc init {} {
}

proc process_generic {p_arg_array} {
    upvar $p_arg_array arg_array

    return
}

proc eval_init_to_enable {} {
    return 0
}

proc eval_enable_to_testend {} {
    return 0
}

proc eval_testend_to_shutdown {} {
    return 0
}

proc act_init_to_enable {} {
    return
}

proc act_enable_to_testend {} {
    return
}

proc act_testend_to_shutdown {} {
    return
}

}
proc Dump {p_data} {

    upvar $p_data data
    return
}

}
