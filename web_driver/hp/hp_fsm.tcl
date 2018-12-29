global env
source $env(PATTERN_HOME)/time_util.tcl
namespace eval hp_fsm {

variable gTable
variable gValue
variable gKey

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gTable
    variable gValue
    variable gKey
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    if {[info exist gTable]} {
	unset gTable
    } 
    array set gTable {}
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

proc eval_begin_to_custom_string {} {
    variable m_text
    if {[string first "Adj Close" $m_text] > -1} {
	return 1
    }
    return 0
}

proc eval_to_key {} {
    variable m_text
   
    regsub -all "\n" $m_text "" data 
    regsub -all "\r" $data  "" data 
    regsub -all " " $data "" data
    if {$data == ""} {
	return 0
    }
    regsub -all "," $data "" data
    regsub {\.} $data "" data
    if {![string is digit $data] &&
         [string first "*" $data] == -1} {
	return 1
    }
    return 0
}

proc eval_key_to_value {} {
    variable m_text
   
    regsub -all "\n" $m_text "" data 
    regsub -all "\r" $data  "" m_text
    regsub -all " " $data "" data
    if {$data == ""} {
	return 0
    }
    regsub -all "," $data "" data
    regsub {\.} $data "" data
    if {[string is digit $data]} {
	return 1
    }
    return 0
}

proc eval_key_to_custom_string3 {} {
    variable m_text
   
    if {[string first "Dividend" $m_text] > -1 ||
        [string first "Merge" $m_text] > -1 ||
        [string first "Split" $m_text] > -1} {
	return 1 
    }
    return 0
}

proc eval_to_custom_string2 {} {
    variable m_text

    if {[string first "*" $m_text] > -1} {
	return 1
    }
    return 0
}

proc eval_custom_string2_to_terminate {} {
    variable m_text

    if {[string first "Next" $m_text] > -1} {
	return 1
    }
    return 0
}

proc act_set_key {} {
    variable m_text
    variable gTable
    variable gValue
    variable gKey

    if {$gValue != "" && $gKey != ""} {
	set gTable($gKey) $gValue
	set gValue ""
	set gKey ""
    }
    regsub -all "&nbsp;" $m_text "" m_text
    set gKey [UtilTime::Convert $m_text]
    return
}

proc act_clear_key {} {
    variable gKey

    set gKey ""
    return
}
proc act_set_value {} {
    variable m_text
    variable gValue

    regsub -all "&nbsp;" $m_text "" m_text
    regsub -all "," $m_text "" m_text
    regsub -all " " $m_text "" m_text
    regsub -all "\n" $m_text "" m_text
    regsub -all "\r" $m_text "" m_text
    regsub {\.} $m_text "" data
    if {$m_text != "" &&
        [string is digit $data]} {
	lappend gValue $m_text
    }
    return
}

proc act_set_value_only {} {
    variable m_text
    variable gTable
    variable gValue
    variable gKey

    if {$gValue != "" && $gKey != ""} {
	set gTable($gKey) $gValue
	set gValue ""
	set gKey ""
    }
    return
}

proc act_to_terminate {} {
    variable m_text
    variable m_param
    variable gTable

    regsub -all "\"" $m_param "" m_param
    set idx [string first "/" $m_param]
    set tmpkey $m_text
    if {$idx != -1} {
        set ref [string range $m_param $idx end]
	regsub -all "amp;" $ref "" ref
        set gTable($tmpkey) $ref 
    } else { 
        set gTable($tmpkey) "" 
    }
    return
}

proc Dump_Table {p_data} {
    upvar $p_data data
    variable gTable

    array set data [array get gTable]
    return 
}

proc Dump {} {
    variable gTable
    variable gKey

    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    puts "key = $gKey"
    foreach idx [lsort [array names gTable]] {
	puts "$idx $gTable($idx)"
    }
    puts "text = $m_text"
    puts "param = $m_param"
    puts "slash = $m_slash"
    puts "tag = $m_tag"
    return
}

}

