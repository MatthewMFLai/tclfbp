namespace eval table_fsm {

proc act_to_field_custom {} {
    variable m_text
    variable m_param
    variable m_slash
    variable m_tag

    set rc ""
    if {$m_tag == "img" &&
	[string first "yellow.jpg" $m_param] > 0} {
	set rc "*"
    }
    return $rc
}

proc store_table_custom {p_table} {
    upvar $p_table table
    set row1 [lindex $table 0]
    set title [lindex $row1 0]
    if {[string first "Dividend Information" $title] != -1 || 
    	[string first "Stock Information" $title] != -1} { 
    	return 1
    } else {
	return 0
    }
}

}
