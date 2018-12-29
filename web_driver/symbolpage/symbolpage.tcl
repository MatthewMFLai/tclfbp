namespace eval symbolpage {

proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    Fsm::Run symbolpage_fsm tmpdata
}

proc doit {group page exchange p_symbollist p_symbollink} {
    upvar $p_symbollist symbollist
    upvar $p_symbollink symbollink

    set symbollist ""
    set symbollink ""

    set url_template "http://www.tmxmoney.com/TMX/HttpController?GetPage=ListedCompanyDirectory&SearchCriteria=Name&SearchKeyword=XXX&SearchType=StartWith&SearchIsMarket=Yes&Page=YYY&Market=$exchange&Language=en"

	regsub "XXX" $url_template $group url_temp
	regsub "YYY" $url_temp $page url
	#puts "Extracting group $group page $page..."
	set data [Url::get $url]
	htmlparse::parse -cmd symbolpage::fsm_if $data
	if {[Fsm::Is_In_Service symbolpage_fsm] == 1} {
	    set total_page [symbolpage_fsm::Dump_Page]
	    if {$total_page > 0} {
	    	#puts $fd [symbolpage_fsm::Dump_Symbols]
	    	#puts $fd2 [symbolpage_fsm::Dump_Link]
	    	#puts $fd3 [symbolpage_fsm::Dump_Symbollink]
	    	set symbollist [symbolpage_fsm::Dump_Symbols]
	    	set symbollink [symbolpage_fsm::Dump_Symbollink]
		regsub -all {tmx.quotemedia} $symbollink \
                    "web.tmxmoney" symbollink
	    }
	} else {
	    puts $fd "$group $page FAIL [Fsm::Get_Error symbolpage_fsm]"
	}
	Fsm::Init_Fsm symbolpage_fsm
	Fsm::Set_State symbolpage_fsm FIND_PAGE
	return $total_page
}

proc init {} {
    return
}
}
