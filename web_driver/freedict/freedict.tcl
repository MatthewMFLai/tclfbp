namespace eval freedict {

variable g_url_template

proc init {url_template} {
    variable g_url_template

    set g_url_template $url_template
    return
}
    
proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    Fsm::Run freedict_fsm tmpdata
}

proc doit {datalist p_tmpdata} {
    variable g_url_template
    upvar $p_tmpdata tmpdata

    set rc 1
    set word [lindex $datalist 0]
    regsub "XXX" $g_url_template $word url
    if {[catch {Url::get_no_retry $url} data]} {
    	return -1 
    }

    if {[catch {htmlparse::parse -cmd freedict::fsm_if $data}]} {
    	Fsm::Init_Fsm freedict_fsm
    	Fsm::Set_State freedict_fsm FIND_WORD
	return -1
    }
    if {[Fsm::Is_In_Service freedict_fsm] == 1} { 
        array set tmpdata {}
	set tmpdata(WORD_INIT) $word
        freedict_fsm::Dump_Data tmpdata
        freedict_fsm::Reset
    } else {
    	set tmpdata(ERROR) "$word FAIL [Fsm::Get_Error freedict_fsm] [Fsm::Get_Error freedict_fsm]"
	set rc 0
    }
    Fsm::Init_Fsm freedict_fsm
    Fsm::Set_State freedict_fsm FIND_WORD
    return $rc 
}

}
