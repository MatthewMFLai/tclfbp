namespace eval financials {

proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    Fsm::Run financials_fsm tmpdata
}

proc doit {symbol p_data} {
    upvar $p_data web_data
    set rc 1
    # Extract main symbol.
    set url "http://web.tmxmoney.com/financials.php?qm_symbol=$symbol"
    if {[catch {Url::get_no_retry $url} data]} {
        set web_data(urlerror) "$symbol FAIL url error"
        return -1
    }
    if {[catch {htmlparse::parse -cmd financials::fsm_if $data}]} {
    	Fsm::Init_Fsm financials_fsm
    	Fsm::Set_State financials_fsm FIND_ASSET
        set web_data(urlerror) "$symbol FAIL htmlparse error"
	return -1
    }
    if {[Fsm::Is_In_Service financials_fsm] == 1} {
        array set tmpdata {}
        financials_fsm::Dump_Financials tmpdata
	array set web_data [array get tmpdata]
    	unset tmpdata
    } else {
        set web_data(urlerror) "$symbol FAILfsm [Fsm::Get_Error financials_fsm]"
    	Fsm::Init_Fsm financials_fsm
    	Fsm::Set_State financials_fsm FIND_ASSET
	set rc 0	
    }
    Fsm::Init_Fsm financials_fsm
    Fsm::Set_State financials_fsm FIND_ASSET
    return $rc
}

proc extract_data {url} {
# Layout of data in the returned list:
# symbol pe yield marketcap change volume urlerror
    set rc ""
    set symbol [lindex $url 0]
    array set web_data {}
    set web_data(urlerror) ""
    set web_data(symbol) $symbol 
    financials::doit $symbol web_data

    return [array get web_data] 
}

}
