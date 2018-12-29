proc process {inport p_ip} {
    global g_view

    array set data [byList::get_list $p_ip]
    set symbol $data(SYMBOL)
    unset data(SYMBOL)

    regsub -all {\.} $symbol "_" symbol_nodot
    if {![info exists g_view($symbol)]} {
    	set g_view($symbol) [mk::view layout g_db.$symbol_nodot "date close volume"]
    }
    set view $g_view($symbol)

    foreach idx [array names data] {
	array set tmpdata {}
	set tmpdata(date) $idx
	set tmpdata(close) [lindex $data($idx) 5]
	set tmpdata(volume) [lindex $data($idx) 4]
    	set row [mk::row append $view]
    	eval mk::set $row [array get tmpdata]
	unset tmpdata
    }
    mk::file commit $view

    return
}

proc init {datalist} {
    global g_db
    global g_view

    set filename [lindex $datalist 0]
    mk::file open g_db $filename
    array set g_view {}
    return
}

proc shutdown {} {
    global g_db

    mk::file close g_db
    return
}

global env
source $env(COMP_HOME)/ip2/byList.tcl
global tcl_platform
if {[string first "Windows" $tcl_platform(os)] > -1} {
    package require Mk4tcl
} else {
    load Mk4tcl.so
}
global g_db
set g_db ""
