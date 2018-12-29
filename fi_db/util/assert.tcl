namespace eval Assert {

    variable m_assert

proc Init {{flag 1}} {

    variable m_assert

    set m_assert $flag
    return
}

proc Assert {p_object} {
    variable m_assert

    if {$m_assert == 0} {
	return
    }

    if {$p_object == "NULL" ||
        $p_object == ""} {
	puts "Empty pointer detected!"
	puts [info level -1]
	exit -1
    }
}

proc Check {p_object} {
    if {$p_object == "NULL" ||
        $p_object == ""} {
	return 0	
    } else {
	return 1
    }
}
}
	
