namespace eval optionlist {

proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    Fsm::Run optionlist_fsm tmpdata
}

proc doit {url p_optionlist} {
    upvar $p_optionlist optionlist 

    set optionlist ""
    set data [Url::get $url]
    htmlparse::parse -cmd optionlist::fsm_if $data
    if {[Fsm::Is_In_Service optionlist_fsm] == 1} {
    	set optionlist [optionlist_fsm::Dump]
    } else {
	puts "FAIL optionlist [Fsm::Get_Error optionlist_fsm]"
    }
}

}
