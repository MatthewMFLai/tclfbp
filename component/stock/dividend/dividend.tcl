proc process_dividend {url p_data} {
    upvar $p_data data

    array set tmpdata $url
    if {$tmpdata(Yield) == "N/A"} {
	set data(urlerror) "N/A"
	return
    }

    set cur_symbol $tmpdata(fundamental_symbol)
    dividend::extract_data $cur_symbol data

    if {$data(urlerror) != ""} {
	if {[string first "no dividend symbol found" $data(urlerror)] > 0} {
	    set data(urlerror) "N/A"
	}
	return
    }
}

proc init_dividend {arglist} {
    global env

    set filename [lindex $arglist 0]
    if {[UtilSys::Is_Runtime] == 0} {
    	set fd [open $env(WEB_DRIVER)/dividend/$filename r]
    } else {
    	set fd [open [UtilSys::Get_Path]/web_driver/dividend/$filename r]
    }	
    gets $fd url_template
    close $fd

    # Set up symbol suffix mapper.
    set filename [lindex $arglist 1]
    if {[UtilSys::Is_Runtime] == 0} {
    	set fd [open $env(WEB_DRIVER)/dividend/$filename r]
    } else {
    	set fd [open [UtilSys::Get_Path]/web_driver/dividend/$filename r]
    }	
    while {[gets $fd line] > -1} {
        set mapper([lindex $line 0]) [lrange $line 1 end]
    }
    close $fd

    dividend::init $url_template mapper
    return
}

proc shutdown_dividend {} {
}
