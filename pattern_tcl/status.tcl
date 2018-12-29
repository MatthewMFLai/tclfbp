# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.

proc set_status_fail {p_status} {
    upvar #0 $p_status status 

    set status(&status) "STATUS_ONEFAIL"
}

proc is_status_ok {p_status} {
    upvar #0 $p_status status 

    if {$status(&status) == "STATUS_OK"} {
	return 1
    } else {
        return 0
    }
}

proc is_status_fail {p_status} {
    upvar #0 $p_status status 

    if {$status(&status) == "STATUS_ONEFAIL"} {
	return 1
    } else {
        return 0
    }
}

proc init_status {p_status} {
    upvar #0 $p_status status 
    set status(&status) "STATUS_OK"
}
