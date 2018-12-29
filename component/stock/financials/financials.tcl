proc process_financials {url p_data} {
    upvar $p_data data

    array set data [financials::extract_data $url]
    return
}

proc init_financials {arglist} {
    return
}

proc shutdown_financials {} {
}
