proc process_translate {url p_data} {
    upvar $p_data data

    array set tmpdata $url
    set word $tmpdata(word)
    translate::extract_data $word data
}

proc init_translate {arglist} {
    global env

    set filename [lindex $arglist 0]
    if {[UtilSys::Is_Runtime] == 0} {
    	set fd [open $env(WEB_DRIVER)/translate/$filename r]
    } else {
    	set fd [open [UtilSys::Get_Path]/web_driver/translate/$filename r]
    }
    gets $fd url_template
    close $fd

    translate::init $url_template
    return
}

proc shutdown_translate {} {
}
