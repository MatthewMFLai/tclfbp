namespace eval UtilSys {

proc get_argv {} {
    # filepath should look like /disk2/component/basic/sink/0.01/sink.tcl
    # or
    # filepath should look like /disk2/component/basic/sink/sink.tcl
    global argv
    global tcl_platform

    set datalist $argv
    if {$tcl_platform(os) == "Linux"} {
    	regsub -all {\\} $datalist "" datalist
    }
    array set tmptable $datalist
    if {[info exists tmptable(PROGRAM)]} {
    	return $tmptable(PROGRAM)
    } else {
	return ""
    }
}
 
proc Get_Path {} {
    # filepath should look like /disk2/component/basic/sink/0.01/sink.tcl
    # or
    # filepath should look like /disk2/component/basic/sink/sink.tcl

    set filepath [get_argv]
    # Remove script name first.
    set idx [string last "/" $filepath]
    incr idx -1
    set filepath [string range $filepath 0 $idx]
    return $filepath
}

proc Is_Runtime {} {
    # filepath should look like /disk2/component/basic/sink/0.01/sink.tcl
    # or
    # filepath should look like /disk2/component/basic/sink/sink.tcl

    set filepath [get_argv]
    if {$filepath == ""} {
	return 0
    }
    # Remove script name first.
    set idx [string last "/" $filepath]
    incr idx -1
    set filepath [string range $filepath 0 $idx]
    # Look for version info in the path.
    set idx [string last "/" $filepath]
    incr idx 1
    set version [string range $filepath $idx end]
    regsub -all {\.} $version "" version
    return [string is digit $version]
}
}
