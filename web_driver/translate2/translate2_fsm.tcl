namespace eval translate2_fsm {

variable gWord
variable gTranslatelist

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gWord
    variable gTranslatelist
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set gWord ""
    set gTranslatelist ""

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

proc eval_title_to_h4 {} {
    variable m_tag
    if {[string match "title" $m_tag]} {
	return 1
    }
    return 0
}

proc eval_h4_to_h4 {} {
    variable m_text
    variable m_tag

    set digit [string index $m_text 0]
    if {$digit == ""} {
	return 0
    }
    if {[string first "h4" $m_tag] == 0 && [string is digit $digit]} {
	return 1
    }
    return 0
}

proc eval_h4_to_terminate {} {
    variable m_text
    variable m_tag

    set digit [string index $m_text 0]
    if {$digit == ""} {
	return 0
    }
    if {[string first "h4" $m_tag] == 0 && [string is digit $digit] == 0} {
	return 1	
    }
    return 0
}

proc act_title_to_h4 {} {
    variable m_text
    variable gWord

    set gWord [lindex $m_text 0]
    return
}

proc act_to_h4 {} {
    variable gTranslatelist
    variable m_text

    lappend gTranslatelist [string trim $m_text]
    return
}

proc Dump {} {
    variable gWord
    variable gTranslatelist

    puts "word = $gWord"
    puts "meanings = $gTranslatelist"
    return
}
proc Dump_Translate {p_tmpdata} {
    variable gTranslatelist
    upvar $p_tmpdata tmpdata

    set tmpdata(meanings) $gTranslatelist
    return
}
}

