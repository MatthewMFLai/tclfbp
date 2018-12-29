# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc set_attr1 {p_generic attr} {
    upvar #0 $p_generic generic 

    set generic(&attr1) $attr
}

proc set_attr2 {p_generic attr} {
    upvar #0 $p_generic generic 

    set generic(&attr2) $attr
}

proc set_attr3 {p_generic attr} {
    upvar #0 $p_generic generic 

    set generic(&attr3) $attr
}

proc get_attr1 {p_generic} {
    upvar #0 $p_generic generic 

    return $generic(&attr1)
}

proc get_attr2 {p_generic} {
    upvar #0 $p_generic generic 

    return $generic(&attr2)
}

proc get_attr3 {p_generic} {
    upvar #0 $p_generic generic 

    return $generic(&attr3)
}

proc init {p_generic} {
    upvar #0 $p_generic generic 
    set generic(&attr1) ""
    set generic(&attr2) ""
    set generic(&attr3) ""
}
