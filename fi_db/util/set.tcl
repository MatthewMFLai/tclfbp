proc lintersect {a b} {
    foreach e $a {
        set x($e) {}
    }
    set result {}
    foreach e $b {
        if {[info exists x($e)]} {
            lappend result $e
        }
    }
    return $result
}

proc lunion {a b} {
    foreach e $a {
        set x($e) {}
    }
    foreach e $b {
        if {[info exists x($e)] == 0} {
	    set x($e) 1
        }
    }
    return [array names x] 
}

proc ldifference {a b} {
     foreach e $b {
        set x($e) {}
     }
     set result {}
     foreach e $a {
        if {![info exists x($e)]} {
            lappend result $e
        }
     }
     return $result
}

