namespace eval stock_fsm {

variable m_trim_begin
variable m_trim_end
variable m_data

proc init {} {
    variable m_trim_begin
    variable m_trim_end
    variable m_data
    
    # raw data looks like this
    #{"query":{"count":1,"created":"2016-04-03T14:52:10Z","lang":"en-US","results":{"quote":{"symbol":"fts.to","Ask":"40.79","AverageDailyVolume":"1320660",...,"LastTradeTime":"4:00pm","TickerTrend":null,"OneyrTargetPrice":null,"Volume":"929570","HoldingsValue":null,"HoldingsValueRealtime":null,"YearRange":"34.16 - 41.58","DaysValueChange":null,"DaysValueChangeRealtime":null,"StockExchange":"TOR","DividendYield":"3.72","PercentChange":"+0.15%"}}}}
    #
    # We want to trim everything before the first "quote" and remove the last 4 braces
    #
    set m_trim_begin -1
    set m_trim_end -4 
    if {[info exists m_data]} {
	unset m_data
    }
    array set m_data {}

    return
}

proc process_generic {p_data} {
    upvar $p_data argarray
    variable m_trim_begin
    variable m_trim_end
    variable m_data

    set data $argarray(data)

    set idx [string first "symbol" $data]
    incr idx $m_trim_begin
    set idx2 [string last "\}" $data]
    incr idx2 $m_trim_end
    set dataline [string range $data $idx $idx2]
    set tokens [split $dataline ","]
    foreach token $tokens {
	# token looks like
	# "name":"value"
	set idx [string first ":" $token]
	incr idx -2
	set key [string range $token 1 $idx]
	incr idx 3
	if {[string index $token $idx] == "\""} {
	    incr idx 1
	    set value [string range $token $idx end-1]
	} else {
	    set value [string range $token $idx end]
	}
	regsub -all {\+} $value "" value	
	set m_data($key) $value
    }

    return
}
	    
proc Dump_Stock {p_data} {
    upvar $p_data data
    variable m_data

    array set data [array get m_data]
    return
}

proc Dump {} {
    variable m_data

    foreach idx [lsort [array names m_data]] {
	puts "$idx $m_data($idx)"
    }
    return
}

}
