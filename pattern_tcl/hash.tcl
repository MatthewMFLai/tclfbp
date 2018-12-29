# Substitue <hash> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc hash_add_part {p_whole p_part} {
	upvar $p_whole whole
	upvar $p_part part

	set tmpkey $part(hash_part_key)
	set whole(hash,$tmpkey) $p_part
}

proc hash_get_part {p_whole key} {
	upvar $p_whole whole

	if {[info exists whole(hash,$key)]} {
		return $whole(hash,$key)
	} else {
		return ""
	}
}

proc hash_init_part {p_part key} {
	upvar $p_part part
	set part(hash_part_key) $key
}

proc hash_init_whole {p_whole} {
	upvar $p_whole whole
	set keylist [array names whole "hash,*"]
	foreach keyitem $keylist {
		unset whole($keyitem)
	}
}
