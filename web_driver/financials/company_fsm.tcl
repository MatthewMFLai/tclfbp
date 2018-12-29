namespace eval company_fsm {

variable gCompany
variable gKey
variable gValue

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gCompany
    variable gKey
    variable gValue
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    if {[info exist gCompany]} {
	unset gCompany
    } 
    array set gCompany {}
    set gKey ""
    set gValue ""

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

proc eval_key_to_value {} {
    variable m_param

    regsub -all "\"" $m_param "" data
    if {[string first "class=label" $data] > -1} {
	return 1	
    }
    return 0
}

proc eval_value_to_value_more {} {
    variable m_param

    regsub -all "\"" $m_param "" data
    if {[string first "class=data" $data] > -1} {
	return 1	
    }
    return 0
}

proc eval_value_more_to_key {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "td" && $m_slash == "/"} {
	return 1
    }
    return 0
}

proc eval_key_to_terminate {} {
    variable m_param

    regsub -all "\"" $m_param "" data
    if {[string first "class=companymap" $data] > -1} {
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

proc act_append_value {} {
    variable m_text
    variable gValue

    regsub -all "\t" $m_text "" m_text
    regsub -all "\n" $m_text "" m_text
    regsub -all "&nbsp;" $m_text " " m_text
    if {$m_text != ""} {
        append gValue $m_text
    } 
    return
}

proc act_value_to_key {} {
    variable gCompany
    variable gKey
    variable gValue
    
    set gCompany($gKey) $gValue
    set gKey ""
    set gValue ""
    return
}

proc Dump_Company {p_data} {
    upvar $p_data data
    variable gCompany

    array set data [array get gCompany]
    return 
}

proc Dump {} {
    variable gCompany
    variable gKey

    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    puts "key = $gKey"
    foreach idx [lsort [array names gCompany]] {
	puts "$idx $gCompany($idx)"
    }
    puts "text = $m_text"
    puts "param = $m_param"
    puts "slash = $m_slash"
    puts "tag = $m_tag"
    return
}

}
