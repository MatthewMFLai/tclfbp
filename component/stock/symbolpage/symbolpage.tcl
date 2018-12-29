proc process_symbolpage {datalist p_data} {
    upvar $p_data data

    set data(urlerror) ""
    set symbollist ""
    set symbollink ""
    set group [lindex $datalist 0]
    set page [lindex $datalist 1]
    set exchange [lindex $datalist 2]
    set data(total_page) [symbolpage::doit $group $page $exchange symbollist symbollink]
    if {$data(total_page) > 0} {
	set data(symbollist) $symbollist
	set data(symbollink) $symbollink
    }
    return
}

proc init_symbolpage {arglist} {
    #set exchange [lindex $arglist 0] 
    symbolpage::init
    return
}

proc shutdown_symbolpage {} {
}
