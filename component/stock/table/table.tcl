proc process_table {url p_data} {
    upvar $p_data data

    table::doit $url data
    if {[info exists data(ERROR)]} {
	set data(urlerror) $data(ERROR)
	unset data(ERROR)
    } else {
    	set data(urlerror) ""
    }
    return
}

proc init_table {arglist} {
    return
}

proc shutdown_table {} {
}
