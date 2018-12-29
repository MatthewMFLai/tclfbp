namespace eval company {

variable g_url_template

proc init {url_template} {
    variable g_url_template

    set g_url_template $url_template
    return 
}

proc doit {exchange symbol url_template p_outdata} {
    upvar $p_outdata outdata

    regsub "888" $url_template $symbol tmpurl
    # Quick check.
    if {$exchange == "V"} {
	set exchange "X"
    }
    regsub "999" $tmpurl $exchange url
    if {[catch {Url::get $url} data]} {
    	set outdata(ERROR) $data 
	return 
    }

    set argdata(data) $data
    Fsm::Run company_fsm argdata
    if {[Fsm::Is_In_Service dividend_fsm] == 1} {
    	array set tmpdata {}
    	company_fsm::Dump_Company tmpdata
    	array set outdata [array get tmpdata]
    } else {
    	 set outdata(ERROR) "$symbol FAIL [Fsm::Get_Error dividend_fsm]"
    }

    Fsm::Init_Fsm dividend_fsm
    Fsm::Set_State dividend_fsm ONE

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
