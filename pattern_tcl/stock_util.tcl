namespace eval UtilStock {

proc convert_symbol_GM_YAHOO {symbol} {
	# Symbol remapping
	# xxx.y --> xxx-y
	# xxx.pr.y --> xxx-py
	# xxx.pf.y --> xxx-pfy
	# xxx.un --> xxx-un
	# xxx.wt --> xxx-wt
	regsub {\.} $symbol "-" symbol
	regsub {\-PR\.} $symbol "-P" symbol
	regsub {\-PF\.} $symbol "-PF" symbol
    return $symbol
}

proc convert_exchange_GM_YAHOO {exchange} {
    if {$exchange == "T"} {
    	return "TO"
    } else {
	return "V"
    } 
}

proc convert_symbol_YAHOO_GM {symbol} {
    regsub {\-} $symbol "." symbol
    return $symbol
}

proc convert_exchange_YAHOO_GM {exchange} {
    if {$exchange == "to" || 
        $exchange == "TO"} {
    	return "T"
    } else {
	return "V"
    } 
}

proc Convert_Symbol {src_symbol src target} {
    return [convert_symbol_$src\_$target $src_symbol]
}

proc Convert_Exchange {src_exchange src target} {
    return [convert_exchange_$src\_$target $src_exchange]
}

}
