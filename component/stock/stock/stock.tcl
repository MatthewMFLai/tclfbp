proc process_stock {url p_data} {
    upvar $p_data data

    array set tmpdata $url
    set cur_symbol $tmpdata(fundamental_symbol)
    set exchange $tmpdata(exchange)
    stock::extract_data $exchange $cur_symbol data
    return
}

proc init_stock {arglist} {
    global env

    set filename [lindex $arglist 0]
    if {[UtilSys::Is_Runtime] == 0} {
    	set fd [open $env(WEB_DRIVER)/stock/$filename r]
    } else {
    	set fd [open [UtilSys::Get_Path]/web_driver/stock/$filename r]
    }
    gets $fd url_template
    close $fd
    stock::init $url_template
    return
}

proc shutdown_stock {} {
}
