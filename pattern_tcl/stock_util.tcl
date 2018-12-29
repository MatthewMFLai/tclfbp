namespace eval UtilStock {

proc convert_symbol_GM_YAHOO {symbol} {
    set rc [regsub {\.} $symbol "-" symbol]
    if {$rc} {
	# Other "." are just removed.
    	regsub -all {\.} $symbol "" symbol
    	return $symbol
    }
    return $symbol
}

proc convert_exchange_GM_YAHOO {exchange} {
    if {$exchange == "T"} {
    	return "to"
    } else {
	return "v"
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
	return "X"
    } 
}

proc Convert_Symbol {src_symbol src target} {
    return [convert_symbol_$src\_$target $src_symbol]
}

proc Convert_Exchange {src_exchange src target} {
    return [convert_exchange_$src\_$target $src_exchange]
}

}
