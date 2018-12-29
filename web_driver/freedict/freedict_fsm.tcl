namespace eval freedict_fsm {

variable m_text
variable m_param
variable m_slash
variable m_tag

variable m_word
variable m_difficulty
variable m_cur_category
variable m_cur_number
variable m_cur_data
variable m_category
variable m_data

proc init {} {
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    variable m_word
    variable m_difficulty
    variable m_cur_category
    variable m_cur_number
    variable m_cur_data

    # m_category is an array with category as index and the set of numbers as data eg.
    # m_category("verb ...") = {1 2 3}
    # m_category("Idiom") = {54 55}
    # m_data is an array with number as the index and description as data.
    # m_data(55) = {foo is not as idiom} 
    variable m_category
    variable m_data

    set m_text ""
    set m_param ""
    set m_slash ""
    set m_tag ""

    set m_word ""
    set m_difficulty ""
    set m_cur_category ""
    set m_cur_number ""
    set m_cur_data ""
    array set m_category {}
    array set m_data {}
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

proc eval_head_entry_to_word {} {
    variable m_param

    if {[string first "head-entry" $m_param] > -1} {
	return 1
    }
    return 0
}

proc eval_word_to_category {} {
    variable m_param

    if {[string first "class=\"me\"" $m_param] > -1} {
	return 1
    }
    return 0
}

proc eval_category {} {
    variable m_param

    if {[string first "dbox-pg" $m_param] > -1} {
	return 1
    }
    return 0
}

proc eval_to_number {} {
    variable m_param

    if {[string first "def-set" $m_param] > -1} {
	return 1
    }
    return 0
}

proc eval_number_to_data {} {
    variable m_param

    if {[string first "def-number" $m_param] > -1} {
	return 1
    }
    return 0
}

proc eval_data_to_difficulty {} {
    variable m_param

    if {[string first "tail-wrapper" $m_param] > -1} {
	return 1
    }
    return 0
}

proc eval_difficulty_to_terminate {} {
    variable m_param

    if {[string first "subtext" $m_param] > -1} {
	return 1
    }
    return 0
}

proc act_set_word {} {
    variable m_text
    variable m_word

    set m_word $m_text
    return
}

proc act_append_category {} {
    variable m_text
    variable m_cur_category 

    set data $m_text
    if {$data != ""} {
    	append m_cur_category $data
    	regsub "\n" $m_cur_category "" m_cur_category 
    }
    return
}

proc act_set_number {} {
    variable m_text
    variable m_cur_category
    variable m_cur_number
    variable m_category

    regsub {\.} $m_text "" data
    set m_cur_number $data
    if {[info exists m_category($m_cur_category)] == 0} {
	set m_category($m_cur_category) ""
    }
    lappend m_category($m_cur_category) $m_cur_number
    return
}

proc act_append_data {} {
    variable m_text
    variable m_cur_data

    set data [string trim $m_text]
    if {$data != ""} {
    	append m_cur_data $data
    }
    return
}

proc act_set_data {} {
    variable m_cur_number
    variable m_cur_data
    variable m_data

    set m_data($m_cur_number) $m_cur_data
    set m_cur_number ""
    set m_cur_data ""
    return
}

proc act_data_to_category {} {
    variable m_text
    variable m_cur_category 
    variable m_cur_number
    variable m_cur_data
    variable m_data

    set m_data($m_cur_number) $m_cur_data
    set m_cur_number ""
    set m_cur_data ""

    set m_cur_category [string trim $m_text]
    return
}

proc act_set_difficulty {} {
    variable m_text
    variable m_difficulty

    set m_difficulty $m_text
    return
}

proc Dump {} {
    variable m_word 
    variable m_difficulty
    variable m_category 
    variable m_data 

    puts "word = $m_word"
    puts "difficulty = $m_difficulty"
    puts "Category"
    puts "========"
    foreach idx [lsort [array names m_category]] {
	puts "$idx $m_category($idx)"
    }
    puts "Data"
    puts "===="
    foreach idx [lsort -integer [array names m_data]] {
	puts "$idx $m_data($idx)"
    }
    return
}

proc Dump_Data {p_array} {
    variable m_word 
    variable m_difficulty
    variable m_category 
    variable m_data 
    upvar $p_array tmparray

    set tmparray(WORD) $m_word
    set tmparray(DIFFICULTY) $m_difficulty
    array set tmparray [array get m_data]
    array set tmparray [array get m_category]
    set numbers [llength [array names m_data]]
    set tmparray(NUMBER_MAX) $numbers
    return
}

proc Reset {} {
    variable m_word 
    variable m_difficulty
    variable m_category 
    variable m_data 

    set m_word ""
    set m_difficulty ""
    unset m_category
    unset m_data
    array set m_category {}
    array set m_data {}
    return
}

}
