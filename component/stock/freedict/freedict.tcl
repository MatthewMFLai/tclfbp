proc process_freedict {url p_data} {
    upvar $p_data data

    set rc [freedict::doit $url data]
    if {$rc == 1} {
    	set data(urlerror) "" 
    } else {
	if {![info exists data(ERROR)]} {
	    set data(urlerror) "freedict FAIL"
	} else {
	    set data(urlerror) $data(ERROR)
	}
    }
    return
}

proc init_freedict {arglist} {
    global env
 
    set filename [lindex $arglist 0]
    if {[UtilSys::Is_Runtime] == 0} {
    	set fd [open $env(WEB_DRIVER)/freedict/$filename r]
    } else {
    	set fd [open [UtilSys::Get_Path]/web_driver/freedict/$filename r]
    }	
    gets $fd url_template
    close $fd

    freedict::init $url_template
    return
}

proc shutdown_freedict {} {
}

source $env(PATTERN_HOME)/sys_util.tcl
