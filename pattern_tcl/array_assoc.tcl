# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc add_part {p_whole p_part} {
    upvar #0 $p_whole whole
    upvar #0 $p_part part

    if {![Assert::Check $whole(&part_table)]} {
	set whole(&part_table) [malloc::getmem]
	Assert::Assert $whole(&part_table)
    }
    set part(&whole_ref) $p_whole

    set p_table $whole(&part_table)
    upvar #0 $p_table table
    set key $part(&key)
    if {![info exists table($key)]} {
    	set table($key) $p_part
	return 1
    }
    return 0
}

proc remove_part {p_whole p_part} {
    upvar #0 $p_whole whole
    upvar #0 $p_part part

    set key $part(&key)
    set p_table $whole(&part_table)
    if {![Assert::Check $p_table]} {
	return 0
    }
    upvar #0 $p_table table
    if {[info exists table($key)]} {
    	unset table($key) 
    	set part(&whole_ref) ""

	# Remove table if all parts are removed.
	if {![llength [array names table]]} {
	    malloc::freemem $p_table
	    set whole(&part_table) "NULL"
	}
    	return 1
    }

    return 0
}

proc get_part {p_whole key} {
    upvar #0 $p_whole whole

    set p_table $whole(&part_table)
    if {![Assert::Check $p_table]} {
	return NULL
    }
    upvar #0 $p_table table
    if {[info exists table($key)]} {
	return $table($key)
    } else {
	return NULL
    }
}

proc get_whole {p_part} {
    upvar #0 $p_part part

    return $part(&whole_ref)
}

proc get_key {p_part} {
    upvar #0 $p_part part

    return $part(&key)
}

proc set_key {p_part key} {
    upvar #0 $p_part part
    set part(&key) $key
}

proc get_iterator {p_whole} {
    upvar #0 $p_whole whole

    set p_table $whole(&part_table)
    if {![Assert::Check $p_table]} {
	return "" 
    }
    upvar #0 $p_table table
    set rc ""
    foreach idx [array names table] {
	lappend rc $table($idx)
    }
    return $rc
}

proc init_part_new {p_part} {
    upvar #0 $p_part part
    set part(&whole_ref) ""
    set part(&key) "" 
}

proc init_whole {p_whole} {
    upvar #0 $p_whole whole
    set whole(&part_table) "NULL"
}
