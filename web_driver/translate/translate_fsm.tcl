namespace eval translate_fsm {

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

proc eval_word_to_explanation {} {
    variable m_param
    if {[string first "fz-24" $m_param] > 0} {
	return 1
    }
    return 0
}

proc eval_explanation_to_terminate {} {
    variable m_param
    if {[string first "dictionaryExplanation" $m_param] > 0} {
	return 1
    }
    return 0
}

proc act_word_to_explanation {} {
    variable m_text
    variable gWord

    set gWord $m_text
    return
}

proc act_explanation_to_terminate {} {
    variable m_text
    variable gTranslatelist

    set gTranslatelist $m_text
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

