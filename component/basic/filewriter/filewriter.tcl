proc filter {p_ip} {
    puts "default filter"
    return ""
}

proc process {inport p_ip} {
    global g_fd

    foreach data [filter $p_ip] {
	puts $g_fd $data
    }
    return 
}

proc init {datalist} {
    global g_fd
    global g_filter

    # Check for %Y%m%d format in file name. If found, replace
    # it with the actual YYYYMMDD string.
    set datepattern "%Y%m%d"
    set filename [lindex $datalist 0]
    set datestr [clock format [clock seconds] -format $datepattern] 
    regsub $datepattern $filename $datestr filename
    set g_fd [open $filename w]
    set g_filter [lindex $datalist 1]
    if {$g_filter != ""} {
	if {[catch {source $g_filter} rc]} {
	    puts $rc
	    exit -1
	}
    }
    # Optional data for filter.
    set filterdata [lindex $datalist 2]
    if {$filterdata != ""} {
	puts $g_fd [filter_pre $filterdata]
    }
    return
}

proc shutdown {} {
    global g_fd

    close $g_fd
    return
}

global g_fd
global g_filter
set g_fd ""
set g_filter ""
