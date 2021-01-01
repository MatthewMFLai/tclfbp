namespace eval company {

variable g_url_template

proc init {url_template} {
    variable g_url_template

    set g_url_template $url_template
    return 
}

proc doit {exchange symbol url_template p_outdata} {
    upvar $p_outdata outdata

    set symbol [UtilStock::convert_symbol_GM_YAHOO $symbol]
    set exchange [UtilStock::convert_exchange_GM_YAHOO $exchange]
    regsub -all "888" $url_template $symbol tmpurl
    regsub -all "999" $tmpurl $exchange url
    if {[catch {Url::get_no_retry $url} data]} {
    	set outdata(ERROR) $data 
	return 
    }

    set argdata(data) $data
    Fsm::Run company_fsm argdata
    if {[Fsm::Is_In_Service company_fsm]} {
    	array set tmpdata {}
    	company_fsm::Dump_Company tmpdata
    	array set outdata [array get tmpdata]
    } else {
    	 set outdata(ERROR) "$symbol FAIL [Fsm::Get_Error dividend_fsm]"
    }

    Fsm::Init_Fsm company_fsm
    Fsm::Set_State company_fsm ONE

    return
}

proc extract_data {exchange symbol p_data} {
    variable g_url_template
    upvar $p_data data

    array set tmpdata {}
    doit $exchange $symbol $g_url_template tmpdata
    if {[info exists tmpdata(ERROR)] == 0} {
	array set data [array get tmpdata]
	set data(urlerror) ""
	set data(symbol) $symbol
    } else {
	set data(urlerror) $tmpdata(ERROR)
    }
    return
}

}
