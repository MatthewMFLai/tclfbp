# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
#

proc add_key {p_entity key value} {
    upvar #0 $p_entity entity

    if {[info exists entity(&keylist)] == 0} {
    	set entity(&keylist) ""
    }

    if {[lsearch $entity(&keylist) $key] == -1} { 
    	set entity(&keylist) [concat $entity(&keylist) "$key $value"]
    } else {
	# Matt: what to do here?
    }
    return 0
}

proc remove_key {p_entity key} {
    upvar #0 $p_entity entity

    if {[info exists entity(&keylist)] == 0} {
	return
    }

    set idx [lsearch $entity(&keylist) $key]
    if {$idx != -1} {
	set idx2 [expr $idx + 1]
    	set entity(&keylist) [lreplace $entity(&keylist) $idx $idx2]

	if {[llength $entity(&keylist)] == 0} {
    	    unset entity(&keylist)
    	}
    } else {
	# Matt: what to do here?
    }

    return 0
}

proc get_key {p_entity key} {
    upvar #0 $p_entity entity

    if {[info exists entity(&keylist)] == 0} {
	return ""
    }

    set idx [lsearch $entity(&keylist) $key]
    if {$idx != -1} {
	incr idx
    	return [lindex $entity(&keylist) $idx]
    } else {
	return ""	
    }
}
