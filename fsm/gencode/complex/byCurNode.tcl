namespace eval byCurNode {
# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc add_rel {p_entity p_entity2} {
    upvar #0 $p_entity entity
    upvar #0 $p_entity2 entity2 

    set entity(pointer:byCurNode:reference) $p_entity2

    return 0
}

proc remove_rel {p_entity} {
    upvar #0 $p_entity entity

    set entity(pointer:byCurNode:reference) "" 

    return 0
}

proc get_rel {p_entity} {
    upvar #0 $p_entity entity

    return $entity(pointer:byCurNode:reference)
}

proc init_entity {p_entity} {
    upvar #0 $p_entity entity
    set entity(pointer:byCurNode:reference) ""
}

}
