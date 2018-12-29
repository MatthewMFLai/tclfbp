proc process_gutenberg {url p_data} {
    upvar $p_data data

    array set tmpdata $url
    set word $tmpdata(word)
    gutenberg::extract_data $word data

    # We have issue sending the "\n" out so the get around solution
    # is to replace "\n" with "%%%". All downstream components
    # need to perform the inverse substitution of "%%%" with "\n"
    # if the content is to be displayed on screen.
    if {[info exists data(content)]} {
	regsub -all "\n" $data(content) "%%%" data(content)
    }
}

proc init_gutenberg {arglist} {
    global env

    set filename [lindex $arglist 0]
    if {[UtilSys::Is_Runtime] == 0} {
    	set fd [open $env(WEB_DRIVER)/gutenberg/$filename r]
    } else {
    	set fd [open [UtilSys::Get_Path]/web_driver/gutenberg/$filename r]
    }
    set url_templates ""
    set regexps ""
    gets $fd line
    lappend url_templates $line 
    gets $fd line
    lappend url_templates $line 
    gets $fd line
    lappend regexps $line 
    gets $fd line
    lappend regexps $line 
    gets $fd line
    lappend regexps $line 
    close $fd

    gutenberg::init $url_templates $regexps
    return
}

proc shutdown_gutenberg {} {
}
