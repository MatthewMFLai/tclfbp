proc process_fundamental {url p_data} {
    upvar $p_data data

    array set data [fundamental::extract_data $url]
    return
}

proc init_fundamental {arglist} {
    return
}

proc shutdown_fundamental {} {
}
