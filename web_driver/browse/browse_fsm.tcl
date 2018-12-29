namespace eval browse_fsm {

variable gWordlist

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gWordlist
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set gWordlist ""

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

proc eval_word1_to_word2 {} {
    variable m_param

    if {[string first {class="head-entry"} $m_param] >= 0} {
	return 1
    }
    return 0
}

proc eval_word2_to_word1 {} {
    variable m_param

    if {[string first {class="me" data-syllable=} $m_param] == 0} {
	return 1
    }
    return 0
}

proc act_word2_to_word1 {} {
    variable gWordlist
    variable m_text

    lappend gWordlist [string tolower [string trim $m_text]]
    return
}

proc Dump {} {
    variable gWordlist

    puts "root = [lsort -unique $gWordlist]"
    return
}
proc Dump_Translate {p_tmpdata} {
    variable gWordlist
    upvar $p_tmpdata tmpdata

    set tmpdata(root) [lsort -unique $gWordlist]
    return
}
}
