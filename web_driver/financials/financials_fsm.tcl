namespace eval financials_fsm {

variable gFinancials
variable gKey

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gFinancials
    variable gKey
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    if {[info exist gFinancials]} {
	unset gFinancials
    } 
    array set gFinancials {}
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

proc eval_asset_to_asset_value {} {
    variable m_param
    variable m_text

    regsub -all "'" $m_param "" data
    if {[string first "class=down" $data] > -1 && 
        [string first "Total Assets" $m_text] > -1} {
	return 1	
    }
    return 0
}

proc eval_liability_to_liability_value {} {
    variable m_param
    variable m_text

    if {$m_param == "" && 
        [string first "Total Liabilities" $m_text] > -1} {
	return 1	
    }
    return 0
}

proc eval_value {} {
    variable m_param

    if {[string first "data-org-value" $m_param] > -1} {
	return 1	
    }
    return 0
}

proc act_set_key {} {
    variable m_text
    variable gKey

    set gKey $m_text
    return
}

proc act_set_value {} {
    variable m_text
    variable gFinancials
    variable gKey

    set m_text [string trim $m_text]
    regsub -all "," $m_text "" m_text    
    set gFinancials($gKey) $m_text
    set gKey ""
    return
}

proc Dump_Financials {p_data} {
    upvar $p_data data
    variable gFinancials

    array set data [array get gFinancials]
    return 
}

proc Dump {} {
    variable gFinancials
    variable gKey

    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    puts "key = $gKey"
    foreach idx [lsort [array names gFinancials]] {
	puts "$idx $gFinancials($idx)"
    }
    puts "text = $m_text"
    puts "param = $m_param"
    puts "slash = $m_slash"
    puts "tag = $m_tag"
    return
}

}
