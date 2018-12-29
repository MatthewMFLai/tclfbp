proc process_hp {url p_data} {
    upvar $p_data data

    set data(urlerror) [hp::extract_data $url data]
    return
}

proc init_hp {arglist} {
    return
}

proc shutdown_hp {} {
}
