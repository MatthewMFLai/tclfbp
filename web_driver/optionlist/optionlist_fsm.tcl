namespace eval optionlist_fsm {
variable gOptionlist

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gOptionlist
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set gOptionlist ""

    set m_text ""
    set m_param ""
    set m_slash ""
    set m_tag ""
}

proc process_generic {p_arg_array} {
    upvar $p_arg_array arg_array
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set m_text $arg_array(text)
    set m_param $arg_array(param)
    set m_slash $arg_array(slash)
    set m_tag $arg_array(tag)
    return
}

proc eval_table_to_table_end {} {
    variable m_text
    if {[string first "Name of underlying instrument" $m_text] > -1} {
	return 1
    }
    return 0
}

proc eval_table_end_to_terminate {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "table" &&
        $m_slash == "/"} {
	return 1
    }
    return 0
}

proc eval_table_end_to_table_end {} {
    variable m_tag
    variable m_slash

    if {$m_tag != "table" || 
        $m_slash != "/"} {
	return 1
    }
    return 0
}

proc act_table_end_to_table_end {} {
    variable m_param
    variable gOptionlist

    # The param data looks like
    # href="nego_cotes_en.php?symbol=AAV*#cote"
    set idx [string first "href=" $m_param]
    if {$idx == -1} {
	return
    }
    set idx [string first "symbol=" $m_param]
    if {$idx == -1} {
	return
    }
    regsub -all "\"" $m_param "" m_param
    regsub "href=" $m_param "http://www.m-x.ca/" m_param
    lappend gOptionlist $m_param 
    return
}

proc Dump {} {
    variable gOptionlist 

    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    return $gOptionlist
}

}

