namespace eval symbols {

variable g_url_template

proc init {url_template} {
    variable g_url_template

    set g_url_template $url_template
    return 
}

proc doit {exchange group url_template p_outdata} {
    upvar $p_outdata outdata

    regsub -all "999" $url_template $group tmpurl
    # Quick check.
    if {$exchange == "V"} {
    	regsub -all "888" $tmpurl $exchange url
    } else {
    	regsub -all "888" $tmpurl "" url
	}
    if {[catch {Url::get_no_retry $url} data]} {
    	set outdata(ERROR) $data 
	return 
    }

    set argdata(data) $data
    Fsm::Run symbols_fsm argdata
    if {[Fsm::Is_In_Service symbols_fsm]} {
    	array set tmpdata {}
    	symbols_fsm::Dump_Symbols tmpdata
    	array set outdata [array get tmpdata]
    } else {
    	 set outdata(ERROR) "$symbol FAIL [Fsm::Get_Error dividend_fsm]"
    }

    Fsm::Init_Fsm symbols_fsm
    Fsm::Set_State symbols_fsm ONE

    return
}

proc extract_data {exchange group p_data} {
    variable g_url_template
    upvar $p_data data

    array set tmpdata {}
    doit $exchange $group $g_url_template tmpdata
    if {[info exists tmpdata(ERROR)] == 0} {
		array set data [array get tmpdata]
		set data(urlerror) ""
		set data(group) $group
    } else {
		set data(urlerror) $tmpdata(ERROR)
    }
    return
}

}
