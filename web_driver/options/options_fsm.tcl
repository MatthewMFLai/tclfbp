namespace eval options_fsm {

variable gRows
variable gRow_cur
variable gField
variable gOpenInterest
variable gCallput

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gRows
    variable gRow_cur
    variable gField
    variable gOpenInterest
    variable gCallput
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set gRows "" 
    set gRow_cur ""
    set gField ""
    set gOpenInterest 0
    set gCallput "Calls"

    set m_text ""
    set m_param ""
    set m_slash ""
    set m_tag ""
}

proc set_callput {callput} {
    variable gCallput

    if {$callput == "CALL"} {
	set gCallput "Calls"
    } else {
	set gCallput "Puts"
    }
    return
}

proc process_generic {p_arg_array} {
    upvar $p_arg_array arg_array
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set m_text [string trim $arg_array(text)]
    regsub -all "&#160;" $m_text "" m_text
    set m_param $arg_array(param)
    set m_slash [string trim $arg_array(slash)]
    set m_tag [string trim $arg_array(tag)]
    return
}

proc eval_callput_to_table {} {
    variable m_text
    variable gCallput

    if {$m_text == $gCallput} { 
	return 1
    }
    return 0
}

proc eval_table_to_row {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "tbody" &&
        $m_slash == ""} {
	return 1
    }
    return 0
}

proc eval_row_to_field {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "tr" &&
        $m_slash == ""} {
	return 1
    }
    return 0
}

proc eval_field_to_field_end {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "td" &&
        $m_slash == ""} {
	return 1
    }
    return 0
}

proc eval_field_end_to_field_end {} {
    variable m_tag
    variable m_slash
    variable m_text

    if {$m_tag != "td" || 
        $m_slash != "/"} {
        if {[string first "Stock close adjusted" $m_text] == -1} {
	    return 1
	}
    }
    return 0
}

proc eval_field_end_to_field {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "td" &&
        $m_slash == "/"} {
	return 1
    }
    return 0
}

proc eval_field_to_row {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "tr" &&
        $m_slash == "/"} {
	return 1
    }
    return 0
}

proc eval_row_to_terminate {} {
    variable m_tag
    variable m_slash
    variable m_text

    if {$m_tag == "tbody" &&
        $m_slash == "/"} {
	return 1
    }
    return 0
}

proc act_row_to_field {} {
    variable m_param
    variable gOpenInterest

    set pattern "Open interest"
    set idx [string first $pattern $m_param]
    if {$idx == -1} {
	return
    }
    incr idx [string length $pattern]
    set idx2 [string first "\]" $m_param $idx]
    if {$idx == -1} {
	return
    }
    incr idx2 -1
    set gOpenInterest [string range $m_param $idx $idx2] 
    return
}

proc act_field_to_field_end {} {
    variable m_text
    variable gField

    if {$m_text != ""} {
    	append gField $m_text
    }  
    return
}

proc act_field_end_to_field_end {} {
    variable m_text
    variable m_slash
    variable m_tag
    variable gField

    if {$m_tag == "a" && 
        $m_slash == "" &&
    	$m_text != ""} {
    	append gField " $m_text"
    }
    return
}

proc act_field_end_to_field {} {
    variable gRow_cur 
    variable gField

    if {$gField != ""} {
    	lappend gRow_cur $gField
    	set gField ""
    } else {
	lappend gRow_cur "null"
    }
    return
}

proc act_field_to_row {} {
    variable gRow_cur 
    variable gRows
    variable gOpenInterest

    lappend gRow_cur $gOpenInterest
    lappend gRows $gRow_cur
    set gRow_cur ""
    set gOpenInterest 0
    return
}

proc Dump {p_rows} {
    variable gRows

    upvar $p_rows rows
    set rows $gRows
    return
}


}

