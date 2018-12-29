#Revenue: 773
#f_Sector Financial Services
#AW.UN A & W REVENUE ROYALTIES INCOME FUND, through its subsidiary, A&W TradeMarks Inc., licences trade-marks to others for royalty income.
#Assets: 800
#f_Name A&W Revenue Royalties
#Profit: 377
#Assets $74819000
#Cash Flow $8745000
#Sales $11982000
#Liabilities-to-Equity Ratio 0.01
#Price to Book 2.12
#Current Ratio n/a
#Liabilities $911000
#Price to Cash Flow 17.92
#Return on Equity 15.97%
#Price to Sales 13.08
#Earnings $11982000
#Cash $893000
#---------------
namespace eval Financial_Parser {
    variable m_parser
    variable m_last_metric

proc Init {} {
    variable m_parser
    variable m_last_metric
    array set m_parser {}
    set m_last_metric ""
}

proc Reset {} {
    variable m_parser
    foreach idx [array names m_parser] {
	unset m_parser($idx)
    }
}

proc Process {line} {
    variable m_parser

    if {[string first "-----" $line] == 0} {
	if {[array names m_parser] != ""} {
	    return 1
	} else {
	    return 0
	}
    }
    regsub -all "\"" $line "%" line
    regsub -all {\$} $line "" line
    regsub -all "," $line "" line
    set symbol [lindex $line 0]
    if {$symbol != "f_Info"} {
    	regsub -all {\$} $line "" line
    	regsub -all "," $line "" line
    	regsub -all "%" $line "" line
    }
    set idx [string first " " $line]
    if {$idx > -1} {
    	incr idx 1
    	set description [string range $line $idx end]
    } else {
	set description ""
    }

    if {[string first "f_" $line] == 0} {
    	set m_parser($symbol) $description 	
    } else {
	set value [lindex $line end]
	set idx [string last " " $line]
	incr idx -1
	set metric [string range $line 0 $idx]
	regsub ":" $metric "" metric
	if {[info exists m_parser($metric)] == 0} {
	    set m_parser($metric) $value
	}
    }
    return 0
}

proc Dump {} {
    variable m_parser

    foreach idx [lsort [array names m_parser]] {
	puts "$idx $m_parser($idx)"
    }
}

proc Get_Current {p_result} {
    upvar $p_result result
    variable m_parser

    array set result [array get m_parser]
}
}
