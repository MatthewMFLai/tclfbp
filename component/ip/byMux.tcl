namespace eval byMux {
# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
#

proc add_key {p_entity key value} {
    upvar #0 $p_entity entity

    if {[info exists entity(key_value:byMux:keylist)] == 0} {
    	set entity(key_value:byMux:keylist) ""
    }

    if {[lsearch $entity(key_value:byMux:keylist) $key] == -1} { 
    	set entity(key_value:byMux:keylist) [concat $entity(key_value:byMux:keylist) "$key $value"]
    } else {
	# Matt: what to do here?
    }
    return 0
}

proc remove_key {p_entity key} {
    upvar #0 $p_entity entity

    if {[info exists entity(key_value:byMux:keylist)] == 0} {
	return
    }

    set idx [lsearch $entity(key_value:byMux:keylist) $key]
    if {$idx != -1} {
	set idx2 [expr $idx + 1]
    	set entity(key_value:byMux:keylist) [lreplace $entity(key_value:byMux:keylist) $idx $idx2]

	if {[llength $entity(key_value:byMux:keylist)] == 0} {
    	    unset entity(key_value:byMux:keylist)
    	}
    } else {
	# Matt: what to do here?
    }

    return 0
}

proc get_key {p_entity key} {
    upvar #0 $p_entity entity

    if {[info exists entity(key_value:byMux:keylist)] == 0} {
	return ""
    }

    set idx [lsearch $entity(key_value:byMux:keylist) $key]
    if {$idx != -1} {
	incr idx
    	return [lindex $entity(key_value:byMux:keylist) $idx]
    } else {
	return ""	
    }
}

}
