namespace eval dividend {

variable g_url_template
variable g_mapper

proc init {url_template p_mapper} {
    variable g_url_template
    variable g_mapper
    upvar $p_mapper mapper

    set g_url_template $url_template
    array set g_mapper [array get mapper]
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
    Fsm::Run dividend_fsm tmpdata
}

proc doit {cur_symbol url_template p_mapper p_out_symbol p_outdata} {
    upvar $p_outdata outdata
    upvar $p_mapper mapper
    upvar $p_out_symbol out_symbol

    # This is kludgy code. Let me explain.
    # The dividend website does not map .UN to _U always.
    # Most of the time it is .UN to _U, but sometimes it is 
    # .UN to __U, or even to ___U. To handle the ambiguity,
    # the symbol.map is constructed as a map from say
    # .UN to {_U __U ___U}
    # and we just go through all the mappings and pick the one
    # that parses with the valid "paidsince" data.
    # Also, we need to handle the case where the symbol has no .UN,
    # so we just initialize suffix and suffixlist to "none", and
    # the foreach loop will simple just execute once there.
    set suffixlist "none"
    set suffix "none"
    foreach token [array names mapper] {
	if {[string first $token $cur_symbol] > -1} {
	    set suffixlist $mapper($token)
	    set suffix $token
	    break
	}
    }

    foreach newsuffix $suffixlist {

    	regsub $suffix $cur_symbol $newsuffix symbol
    	regsub "XXX" $url_template $symbol url
	if {[catch {Url::get $url} data]} {
	    puts "dividend error: $url"
	    continue
	}
    	htmlparse::parse -cmd dividend::fsm_if $data
    	set paidsince ""
    	if {[Fsm::Is_In_Service dividend_fsm] == 1} {
    	    array set tmpdata {} 
    	    dividend_fsm::Dump_Dividend tmpdata
    	    foreach idx [array names tmpdata] {
	    	if {[string first "Paid Since" $idx] > -1} {
	    	    set paidsince $tmpdata($idx)
		    break 
	    	}
	    }
	    if {$paidsince == "None"} {
    	    	Fsm::Init_Fsm dividend_fsm
    	    	Fsm::Set_State dividend_fsm FIND_DIVIDEND
		unset tmpdata
	    	continue
	    }
	    array set outdata [array get tmpdata]
    	} else {
    	    set outdata(ERROR) "$symbol FAIL [Fsm::Get_Error dividend_fsm]"
	    break
    	}
    	Fsm::Init_Fsm dividend_fsm
    	Fsm::Set_State dividend_fsm FIND_DIVIDEND
	set out_symbol $symbol
    	return
    }
    if {![info exists outdata(ERROR)]} {
    	set outdata(ERROR) "$symbol FAIL no dividend symbol found"
    }
    return
}

proc extract_data {cur_symbol} {
    variable g_url_template
    variable g_mapper

    set symbol "" 
    array set tmpdata {}
    doit $cur_symbol $g_url_template g_mapper symbol tmpdata

    set yield5yr ""
    set yield ""
    set paidsince ""
    set urlerror ""
    if {[info exists tmpdata(ERROR)] == 0} {
    	foreach idx [array names tmpdata] {
	    if {[string first "Yield 5yr Avg" $idx] > -1} {
	    	set yield5yr $tmpdata($idx)
		continue
	    }
	    if {[string first "Yield" $idx] > -1} {
	    	set yield $tmpdata($idx)
		continue
	    }
	    if {[string first "Paid Since" $idx] > -1} {
	    	set paidsince $tmpdata($idx)
		continue
	    }
	}
    } else {
	set urlerror $tmpdata(ERROR)
    }
    return [list $symbol $yield $yield5yr $paidsince $urlerror]
}

}
