proc process_stub {url p_data} {
    upvar $p_data data

    array set data $url 
    set data(urlerror) ""
}

proc init_stub {arglist} {
    return
}

proc shutdown_stub {} {
}
