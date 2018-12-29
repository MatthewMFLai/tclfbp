namespace eval options {

proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    Fsm::Run options_fsm tmpdata
}

proc doit {url p_call_options p_put_options} {
    upvar $p_call_options call_options 
    upvar $p_put_options put_options 

    set call_options ""
    set put_options ""
    set data [Url::get $url]
    
    Fsm::Init_Fsm options_fsm
    Fsm::Set_State options_fsm FIND_CALLPUT
    options_fsm::set_callput "CALL"
    htmlparse::parse -cmd options::fsm_if $data
    if {[Fsm::Is_In_Service options_fsm] == 1} {
    	set call_options "" 
    	options_fsm::Dump call_options
	# The first list item is header and last list item
	# is some total info which we do not need.
	set call_options [lrange $call_options 1 end-1]
    } else {
	puts "FAIL call options [Fsm::Get_Error options_fsm]"
    }

    Fsm::Init_Fsm options_fsm
    Fsm::Set_State options_fsm FIND_CALLPUT
    options_fsm::set_callput "PUT"
    htmlparse::parse -cmd options::fsm_if $data
    if {[Fsm::Is_In_Service options_fsm] == 1} {
    	set put_options "" 
    	options_fsm::Dump put_options
	# The first list item is header and last list item
	# is some total info which we do not need.
	set put_options [lrange $put_options 1 end-1]
    } else {
	puts "FAIL put options [Fsm::Get_Error options_fsm]"
    }
}

}
