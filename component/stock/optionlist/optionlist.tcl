proc process_optionlist {url p_data} {
    upvar $p_data data

    set optionlist ""
    optionlist::doit $url optionlist
    set data(optionlist) $optionlist
    # Kludge: optionlist does not return error value yet!
    set data(urlerror) "" 
    if {$data(urlerror) != ""} {
        return 
    }
    return
}

proc init_optionlist {arglist} {
    return
}

proc shutdown_optionlist {} {
}
