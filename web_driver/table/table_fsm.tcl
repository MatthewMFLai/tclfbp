namespace eval table_fsm {

variable gAll
variable gTable
variable gRow
variable gField

variable m_text
variable m_param
variable m_slash
variable m_tag

proc init {} {
    variable gAll
    variable gTable
    variable gRow
    variable gField
    
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set gAll ""
    set gTable ""
    set gRow ""
    set gField ""

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

    set m_text [string trim $arg_array(text)]
    regsub -all "&#160;" $m_text "" m_text
    regsub -all "&#153;" $m_text "" m_text
    regsub -all "&amp;" $m_text "" m_text
    regsub -all "&nbsp;" $m_text "" m_text
    regsub -all "\n" $m_text "" m_text
    regsub -all "\"" $m_text "" m_text
    regsub -all "," $m_text "" m_text
    set m_param $arg_array(param)
    set m_slash [string trim $arg_array(slash)]
    set m_tag [string trim $arg_array(tag)]
    return
}

proc eval_to_table {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "table" &&
        $m_slash == ""} {
	return 1
    }
    return 0
}

proc eval_to_row {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "tr" &&
        $m_slash == ""} {
	return 1
    }
    return 0
}

proc eval_to_field {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "td" &&
        $m_slash == ""} {
	return 1
    }
    return 0
}

proc eval_field_to_field_end {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "td" &&
        $m_slash == "/"} {
	return 1
    }
    return 0
}

proc eval_field_end_to_row_end {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "tr" &&
        $m_slash == "/"} {
	return 1
    }
    return 0
}

proc eval_row_end_to_table_end {} {
    variable m_tag
    variable m_slash

    if {$m_tag == "table" &&
        $m_slash == "/"} {
	return 1
    }
    return 0
}

proc act_to_field {} {
    variable m_text
    variable gField

    if {$m_text != ""} {
	foreach token $m_text {
    	    append gField "$token "
	}
    }  
    set tmpdata [act_to_field_custom]
    if {$tmpdata != ""} {
    	append gField "$tmpdata "
    }
    return
}

proc act_to_field_end {} {
    variable m_text
    variable m_tag
    variable gField
    variable gRow

    if {$m_text != ""} {
	foreach token $m_text {
    	    append gField "$token "
	}
    }

    set tmpdata [act_to_field_custom]
    if {$tmpdata != ""} {
    	append gField "$tmpdata "
    }

    set gField [string range $gField 0 end-1]
    if {$gField != ""} {
    	lappend gRow $gField
    	set gField ""
    }
    return
}

proc act_to_row_end {} {
    variable gRow 
    variable gTable

    if {$gRow != ""} {
    	lappend gTable $gRow
    	set gRow ""
    }
    return
}

proc act_to_table_end {} {
    variable gAll
    variable gTable

    if {$gTable != ""} {
	if {[store_table_custom gTable]} {
    	    lappend gAll $gTable
	}
    	set gTable ""
    }
    return
}

proc act_to_field_custom {} {
    return ""
}

proc store_table_custom {p_table} {
    return 1
}

proc Dump_Tables {p_tables} {
    variable gAll

    upvar $p_tables tables
    set tables $gAll
    return
}

proc Format_Table {p_table} {
    upvar $p_table table

    puts "================"
    foreach row $table {
	puts $row
    }
    puts "================"
    return
}

}
