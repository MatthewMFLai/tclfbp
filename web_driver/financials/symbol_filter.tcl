proc symbol_filter {symbol} {
    if {$symbol == "MCG"} {
	return 1
    }
    set idx [string first "." $symbol]
    if {$idx == -1} {
	return 0
    }
    incr idx
    set suffix [string range $symbol $idx end]
    if {[string first "UN" $suffix] == 0 ||
        [string first "A" $suffix] == 0 ||
        [string first "B" $suffix] == 0 ||
        [string first "DB" $suffix] == 0 ||
        [string first "WT" $suffix] == 0} {
	return 0
    }
    return 1
}

