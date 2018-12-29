# Substitue <ordered_assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc add_part {p_whole p_part} {
    upvar #0 $p_whole whole
    upvar #0 $p_part part

    set part(&whole_ref) $p_whole

    # The pattern attribute ordered_assoc_key
    # is used for inserting the ordered_assoc_part 
    # into the ordered list maintained by the ordered_assoc_whole.
    set key $part(&key)
    set tmplist $whole(&part_list)
    set idx 0
    foreach tmp_part $tmplist {
	global $tmp_part
	eval set cur_key $${tmp_part}(&key)
	if {$key > $cur_key} {
	    break
	}
	incr idx
    }
    set whole(&part_list) [linsert $tmplist $idx $p_part]		
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

proc get_iterator {p_whole} {
    upvar #0 $p_whole whole

    return $whole(&part_list)
}

proc get_key {p_part} {
    upvar #0 $p_part part

    return $part(&key)
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

proc set_key {p_part key} {
    upvar #0 $p_part part
    set part(&key) $key
}

proc init_whole {p_whole} {
    upvar #0 $p_whole whole
    set whole(&part_list) ""
}
