# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc add_rel {p_entity p_entity2} {
    upvar #0 $p_entity entity
    upvar #0 $p_entity2 entity2 

    set idx [lsearch $entity(&rel_list) $p_entity2]
    if {$idx == -1} {
    	lappend entity(&rel_list) $p_entity2
    }

    set idx [lsearch $entity2(&rel_list) $p_entity]
    if {$idx == -1} {
    	lappend entity2(&rel_list) $p_entity
    }

    return 0
}

proc remove_rel {p_entity p_entity2} {
    upvar #0 $p_entity entity
    upvar #0 $p_entity2 entity2

    set idx [lsearch $entity(&rel_list) $p_entity2]
    if {$idx > -1} {
	set entity(&rel_list) [lreplace $entity(&rel_list) $idx $idx]
    }

    set idx [lsearch $entity2(&rel_list) $p_entity]
    if {$idx > -1} {
	set entity2(&rel_list) [lreplace $entity2(&rel_list) $idx $idx]
    }

    return 0
}

proc has_rel {p_entity p_entity2} {
    upvar #0 $p_entity entity
    upvar #0 $p_entity2 entity2 

    set rc 1
    set idx [lsearch $entity(&rel_list) $p_entity2]
    set idx2 [lsearch $entity2(&rel_list) $p_entity]
    if {$idx == -1 || $idx2 == -1} {
    	set rc 0
    }
    return $rc 
}

proc get_rel {p_entity} {
    upvar #0 $p_entity entity

    return $entity(&rel_list)
}

proc init_entity {p_entity} {
    upvar #0 $p_entity entity
    set entity(&rel_list) ""
}
