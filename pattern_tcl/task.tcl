# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc set_task {p_task script data} {
    upvar #0 $p_task task 

    set task(&script) $script
    set task(&script_data) $data
    set task(&script_status) "IDLE"
}

proc set_task_dispatched {p_task} {
    upvar #0 $p_task task 

    set task(&script_status) "DISPATCHED"
}

proc set_task_pass {p_task} {
    upvar #0 $p_task task 

    set task(&script_status) "PASS"
}

proc set_task_fail {p_task} {
    upvar #0 $p_task task 

    set task(&script_status) "FAIL"
}

proc get_task {p_task p_script p_data} {
    upvar #0 $p_task task 
    upvar $p_script script
    upvar $p_data data

    set script $task(&script)
    set data $task(&script_data)
}

proc is_task_pass {p_task} {
    upvar #0 $p_task task 

    if {$task(&script_status) == "PASS"} {
	return 1
    } else {
        return 0
    }
}

proc is_task_fail {p_task} {
    upvar #0 $p_task task 

    if {$task(&script_status) == "FAIL"} {
	return 1
    } else {
        return 0
    }
}

proc is_task_dispatched {p_task} {
    upvar #0 $p_task task 

    if {$task(&script_status) == "DISPATCHED"} {
	return 1
    } else {
        return 0
    }
}

proc is_task_idle {p_task} {
    upvar #0 $p_task task 

    if {$task(&script_status) == "IDLE"} {
	return 1
    } else {
        return 0
    }
}

proc init_task {p_task} {
    upvar #0 $p_task task 
    set task(&script) ""
    set task(&script_data) ""
    set task(&script_status) ""
}
