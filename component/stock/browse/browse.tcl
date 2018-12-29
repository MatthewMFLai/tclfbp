proc process_browse {url p_data} {
    upvar $p_data data

    array set tmpdata $url
    set word $tmpdata(word)
    browse::extract_data $word data
}

proc init_browse {arglist} {
    global env

    set filename [lindex $arglist 0]
    if {[UtilSys::Is_Runtime] == 0} {
    	set fd [open $env(WEB_DRIVER)/browse/$filename r]
    } else {
    	set fd [open [UtilSys::Get_Path]/web_driver/browse/$filename r]
    }
    gets $fd url_template
    close $fd

    browse::init $url_template
    return
}

proc shutdown_browse {} {
}
