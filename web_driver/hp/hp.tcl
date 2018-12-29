namespace eval hp {

proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    Fsm::Run hp_fsm tmpdata
}

proc doit {url p_data} {
    upvar $p_data web_data
    set rc 1

    set symbol $web_data(SYMBOL)
    if {[catch {Url::get_no_retry $url} data]} {
        set web_data(ERROR) "$symbol FAIL url error"
        return -1
    }
    if {[catch {htmlparse::parse -cmd hp::fsm_if $data}]} {
    	Fsm::Init_Fsm hp_fsm
    	Fsm::Set_State hp_fsm FIND_BEGIN
        set web_data(ERROR) "$symbol FAIL htmlparse error"
	return -1
    }
    if {[Fsm::Is_In_Service hp_fsm] == 1} {
        array set tmpdata {}
        hp_fsm::Dump_Table tmpdata
	array set web_data [array get tmpdata]
    	unset tmpdata
    } else {
        set web_data(ERROR) "$symbol FAILfsm [Fsm::Get_Error hp_fsm]"
    	Fsm::Init_Fsm hp_fsm
    	Fsm::Set_State hp_fsm FIND_BEGIN
	set rc 0	
    }
    Fsm::Init_Fsm hp_fsm
    Fsm::Set_State hp_fsm FIND_BEGIN
    return $rc
}

proc extract_data {url p_web_data} {
# Layout of data in the returned list:
    upvar $p_web_data web_data

    # Extract the symbol from url first.
    set idx [string first "s=" $url]
    incr idx 2
    set idx2 [string first "." $url $idx]
    incr idx2 -1
    set web_data(SYMBOL) [string range $url $idx $idx2]

    hp::doit $url web_data

    if {[info exists web_data(ERROR)]} {
    	set urlerror $web_data(ERROR)
    } else {
    	set urlerror "" 
    }
    return $urlerror
}

}

