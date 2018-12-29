# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc add_part {p_whole p_part} {
    upvar #0 $p_whole whole
    upvar #0 $p_part part

    set part(&whole_ref) $p_whole
    lappend whole(&part_list) $p_part
}

proc remove_part {p_whole p_part} {
    upvar #0 $p_whole whole
    upvar #0 $p_part part

    set idx 0
    set key $part(&key)
    foreach p_part $whole(&part_list) {
	upvar #0 $p_part cur_part
	if {$cur_part(&key) == $key} {
	    set whole(&part_list) [lreplace $whole(&part_list) $idx $idx]
	    set part(&whole_ref) ""
	    return 1
	}
	incr idx
    }
    return 0
}

proc get_part {p_whole key} {
    upvar #0 $p_whole whole

    foreach p_part $whole(&part_list) {
	upvar #0 $p_part part
	if {$part(&key) == $key} {
	    return $p_part
	}
    }
    return NULL
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

    return $whole(&part_list)
}

proc init_part {p_part key} {
    upvar #0 $p_part part
    set part(&whole_ref) ""
    set part(&key) $key
}

proc init_part_new {p_part} {
    upvar #0 $p_part part
    set part(&whole_ref) ""
    set part(&key) "" 
}

proc init_whole {p_whole} {
    upvar #0 $p_whole whole
    set whole(&part_list) ""
}
