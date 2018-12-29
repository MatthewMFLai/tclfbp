proc clean {p_map p_map2} {

    upvar $p_map map
    upvar $p_map2 map2

    set rc ""
    foreach idx [array names map2] {
	set value $map2($idx)
	if {![info exists map($value)]} {
	    lappend rc $idx 
	}
    }
    return $rc
}

proc clean_main {filename} {
    if {![file exists $filename]} {
	puts "$filename not found!"
	return
    }
    set fd [open $filename r]
    gets $fd line
    gets $fd line2
    close $fd
    array set map $line
    array set map2 $line2
    set idxlist [clean map map2]
    if {$idxlist == ""} {
	return
    }
    puts "Remove entries: $idxlist"
    foreach idx $idxlist {
	unset map2($idx)
    }
    set fd [open $filename w]
    puts $fd [array get map]
    puts $fd [array get map2]
    close $fd
    return
}
