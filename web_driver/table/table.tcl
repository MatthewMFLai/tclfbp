namespace eval table {

proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    Fsm::Run table_fsm tmpdata
}

proc doit {symbol p_data} {
    upvar $p_data web_data
    set rc 1
    # Extract web page with warrant or debenture data.
    set url "http://ca.dividendinvestor.com/?symbol=ZZZZ&submit=GO"
    regsub "ZZZZ" $url $symbol url 
    if {[catch {Url::get_no_retry $url} data]} {
        return -1
    }
    if {[catch {htmlparse::parse -cmd table::fsm_if $data}]} {
    	Fsm::Init_Fsm table_fsm
    	Fsm::Set_State table_fsm FIND_TABLE_END
	return -1
    }
    if {[Fsm::Is_In_Service table_fsm] == 1} {
        set tmpdata ""
        table_fsm::Dump_Tables tmpdata
	# tmpdata is just a list of records, so we need to add
	# artificial row index to the web_data array to preserve the
	# "ordering" of the records.
	set idx 0
	foreach row $tmpdata {
	    set web_data($idx) $row
	    incr idx
	}
    } else {
        set web_data(ERROR) "$symbol FAIL [Fsm::Get_Error table_fsm]"
    	Fsm::Init_Fsm table_fsm
    	Fsm::Set_State table_fsm FIND_TABLE_END
	set rc 0	
    }
    unset tmpdata
    Fsm::Init_Fsm table_fsm
    Fsm::Set_State table_fsm FIND_TABLE_END
    return $rc
}

}
