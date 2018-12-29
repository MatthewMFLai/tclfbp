namespace eval dividend_fsm {

variable gDividend
variable gKey

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gDividend
    variable gKey
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    if {[info exist gDividend]} {
	unset gDividend
    } 
    array set gDividend {}
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

proc eval_dividend_to_key {} {
    variable m_text
    if {[string first "Dividend Information" $m_text] > -1} {
	return 1
    }
    return 0
}

proc eval_key {} {
    variable m_text
    variable m_tag
    variable m_param

    if {$m_tag == "td" &&
        [string first "class=" $m_param] > -1 &&
        $m_text != ""} {
	return 1	
    }
    if {$m_tag == "font" &&
        [string first "color=" $m_param] == 0 &&
        $m_text != ""} {
	return 1	
    }
    return 0
}

proc eval_value {} {
    variable m_text
    variable m_tag
    variable m_param

    if {$m_tag == "div" &&
        [string first "align=" $m_param] > -1 &&
        $m_text != ""} {
	return 1	
    }
    return 0
}

proc eval_key_to_terminate {} {
    variable m_text

    if {[string first "Stock Information" $m_text] >= 0} {
	return 1	
    }
    return 0
}

proc act_key_to_value {} {
    variable m_text
    variable gKey

    regsub -all ":" $m_text "" m_text 
    if {[string index $m_text end] == " "} {
    	set gKey [string range $m_text 0 end-1]
    } else {
	set gKey $m_text
    }
    regsub -all "&#153;" $gKey "" gKey
    return
}

proc act_value_to_key {} {
    variable m_text
    variable gDividend
    variable gKey

    regsub -all " " $m_text "" m_text 
    regsub -all "," $m_text "" m_text
    regsub -all "\n" $m_text "" m_text
    set gDividend($gKey) $m_text
    set gKey ""
    return
}

proc Dump_Dividend {p_data} {
    upvar $p_data data
    variable gDividend

    array set data [array get gDividend]
    return 
}

proc Dump {} {
    variable gDividend
    variable gKey

    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    puts "key = $gKey"
    foreach idx [lsort [array names gDividend]] {
	puts "$idx $gDividend($idx)"
    }
    puts "text = $m_text"
    puts "param = $m_param"
    puts "slash = $m_slash"
    puts "tag = $m_tag"
    return
}

}
