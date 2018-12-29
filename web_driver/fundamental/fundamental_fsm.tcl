namespace eval fundamental_fsm {

variable gFundamental
variable gKey

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gFundamental
    variable gKey
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    if {[info exist gFundamental]} {
	unset gFundamental
    } 
    array set gFundamental {}
    set gKey ""

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

proc eval_fundamental_quote_to_key {} {
    variable m_text
    if {[string first "Detailed Quote" $m_text] == 0} {
	return 1
    }
    return 0
}

proc eval_key_to_value {} {
    variable m_text

    if {[string first ":" $m_text] > 0 &&
        [string first "Exchange:" $m_text] == -1} {
	return 1	
    }
    return 0
}

proc eval_value_to_key {} {
    variable m_param

    if {[string first "class" $m_param] > -1} {
	return 1	
    }
    return 0
}

proc eval_key_to_terminate {} {
    variable m_text

    if {[string first "Exchange:" $m_text] == 0} {
	return 1	
    }
    return 0
}

proc act_key_to_value {} {
    variable m_text
    variable gKey

    set gKey [string range $m_text 0 end-1]
    return
}

proc act_value_to_key {} {
    variable m_text
    variable gFundamental
    variable gKey

    set m_text [string trim $m_text]
    regsub -all "&nbsp;" $m_text " " m_text 
    regsub -all "," $m_text "" m_text 
    set gFundamental($gKey) $m_text
    set gKey ""
    return
}

proc Dump_Fundamental {p_data} {
    upvar $p_data data
    variable gFundamental

    array set data [array get gFundamental]
    return 
}

proc Dump {} {
    variable gFundamental
    variable gKey

    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    puts "key = $gKey"
    foreach idx [lsort [array names gFundamental]] {
	puts "$idx $gFundamental($idx)"
    }
    puts "text = $m_text"
    puts "param = $m_param"
    puts "slash = $m_slash"
    puts "tag = $m_tag"
    return
}

}
