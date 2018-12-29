proc create_metrics {p_data} {
    upvar $p_data data

    # Ignore f_*.
    foreach idx [array names data] {
	if {[string first "f_" $idx] == 0} {
	    continue
	}
	Fi_db::Handle_Metric $idx
    }
}

proc create_financials_metrics {lines} {
    foreach line $lines {
    	if {[Financial_Parser::Process $line]} {
	    array set tmpdata {}
	    Financial_Parser::Get_Current tmpdata
	    Financial_Parser::Reset
	    create_metrics tmpdata
    	}
    }
}

proc runit_financials {p_data} {
    upvar $p_data data

    # f_Name and f_Symbol must contain valid data.
    # f_Sector and f_Info may contain empty string.
    set desc ""
    set price "n/a"
    set sector ""
    foreach idx [array names data] {
    	switch -- $idx {
	    f_Sector {
		if {$data($idx) != ""} {
		    Fi_db::Handle_Sector $data($idx)
		    set sector $data($idx)
		} else {
		    set sector ""
		}
		unset data($idx)
	    } f_Info {
		set desc $data($idx)	
		unset data($idx)

	    } f_Symbol {
	 	set symbol $data($idx)	
		unset data($idx)

	    } f_Name {
		set company $data($idx)
		#puts "Processing $company"
		if {[Fi_db::Is_Company_Present $data($idx)]} {
		    set company_present 1
		} else {
		    set company_present 0
		    #Fi_db::Handle_Company $data($idx)
		}
		#unset data($idx)

	    } f_Share_price {
		set price $data($idx)
		unset data($idx)

	    } default {
		# No need to do anything. Treat as Metric.
	    }
	}	
    }

    # Need to pass company description for company object creation.   
    if {$company_present == 0} {
	Fi_db::Handle_Company $data(f_Name) $desc
    }
    unset data(f_Name)

    # Company may already exist, especially when the symbol
    # is a derivative instrucment. Check for company presence
    # first.
    if {![string is double $price]} {
	puts "$symbol has invalid share price $price"
	return
    }

    Fi_db::Add_Symbol_to_Company $symbol $company $price
    if {$company_present == 0} {
	if {$sector != ""} {
    	    Fi_db::Add_Company_to_Sector $company $sector
	}

    	foreach metric [array names data] {
	    # Associate the company to each metric.
	    set metric_val $data($metric)
	    if {$metric_val != ""} {
		if {[string first "--" $metric_val] == 0 ||
		    $metric_val == "n/a"} {
		    continue
		}
	    	Fi_db::Add_Company_to_Metric $company $metric $metric_val
	    } else {
		puts "$company has no $metric value!"
	    }
	}
    }
    return $company
}

proc handle_financials {lines} {
    foreach line $lines {
    	if {[Financial_Parser::Process $line]} {
	    array set tmpdata {}
	    Financial_Parser::Get_Current tmpdata
	    Financial_Parser::Reset
	    set company [runit_financials tmpdata]
	    unset tmpdata
    	}
    }
    return $company
}

proc handle_fundamental {line} { 
    set symbol [lindex $line 0]
    set pe [lindex $line 1]
    set yield [lindex $line 2]
    set marketcap [lindex $line 3]
    set change [lindex $line 4]
    set volume [lindex $line 5]
    #puts "Processing $symbol"
    set companyname [Fi_db::Find_Company $symbol]
    if {$companyname == ""} {
	return	
    }
    if {$pe != "N/A"} {
    	Fi_db::Add_Company_to_Metric $companyname "PE" $pe
    }
    if {$yield != "N/A"} {
    	Fi_db::Add_Symbol_to_Yield $symbol $yield
    }
    if {$marketcap != "N/A"} {
    	Fi_db::Add_Company_to_Metric $companyname "Market Cap" $marketcap
    }
    if {$change != "N/A"} {
    	Fi_db::Add_Symbol_to_Metric $symbol "Price Change" $change
    }
    if {$volume != 0} {
    	Fi_db::Add_Symbol_to_Metric $symbol "Volume" $volume
    }
    return
}

proc handle_dividend {line} {
    set symbol [lindex $line 0]
    set yield [lindex $line 1]
    set yield_avg [lindex $line 2]
    set year_since [lindex $line 3]

    # Turn _A to .A
    # Turn _B to .B
    # Turn _U to .UN
    regsub "_A" $symbol {.A} symbol
    regsub "_B" $symbol ".B" symbol
    regsub "_U" $symbol ".UN" symbol
    regsub -all "_" $symbol "" symbol

    #puts "Yield: Processing $symbol"
    
    Fi_db::Set_Symbol_Yield $symbol $yield $yield_avg $year_since
    return
}

array set g_month_map {JA 1 FE 2 MR 3 AL 4 MA 5 JN 6 JL 7 AU 8 SE 9 OC 10 NO 11 DE 12}
array set g_tmpcache {}

proc handle_option {line} {
    global g_month_map
    global g_tmpcache

    set openint [lindex $line end]
    if {$openint == 0} {
	# do not handle option that has 0 open interest.
	return	
    }
    set type [lindex $line 0]
    set symbol [lindex $line 1]
    set datestr [lindex $line 2]
    set year [lindex $datestr 1]
    incr year 2000
    set month $g_month_map([lindex $datestr 2])
    # Get the third Friday.
    set expdate [UtilTime::GetDayStr $year $month 5 3] 

    set strike [lindex $datestr end]
    if {[string is double $strike] == 0} {
	puts "OPTION_$type: $symbol has invalid strike price $strike"
	return	
    }
    if {![info exists g_tmpcache($symbol)]} {
	set company [Fi_db::Find_Company $symbol]
    	set g_tmpcache($symbol) $company
        #puts "OPTION for $symbol"
    } else {
	set company $g_tmpcache($symbol)
    }
    if {$company == ""} {
	puts "No company found for $symbol"
	return	
    }
    # Need to create a timedfitype symbol object here.
    set symbol_option $symbol.$expdate.$strike.$type
    Fi_db::Add_Symbol_to_Company $symbol_option $company [lindex $line 4]
    set rc [Fi_db::Add_Symbol_to_Timed_fi $symbol_option "OPTION_$type"]
    if {$rc == 0} {
	puts "OPTION_$type: $symbol_option not found in fi_db"
	return	
    }
    if {$rc == -1} {
	puts "Option_$type: $symbol_option already set in fi_db"
	return	
    }

    #puts "OPTION_$type $symbol_option $strike $expdate"
    set rc [Fi_db::Add_Plane "OPTION_$type" $symbol_option $strike [clock scan $expdate]]
    if {$rc != ""} {
	puts $rc
	Fi_db::Remove_SymbolTimed "OPTION_$type" $symbol_option
    }
}

proc handle_debenture {line} {
    if {[catch {clock scan [lindex $line 3]} expdate]} {
	puts "[lindex $line 3] cannot be converted to seconds"
	return	
    }

    set symbol [lindex $line 1]
    set strike [lindex $line end-2]
    if {[string is double $strike] == 0} {
	puts "DEBENTURE: $symbol has invalid strike price $strike"
	return	
    }

    set rc [Fi_db::Add_Symbol_to_Timed_fi $symbol "DEBENTURE"]
    if {$rc == 0} {
	puts "DEBENTURE: $symbol not found in fi_db"
	return	
    }
    if {$rc == -1} {
	puts "DEBENTURE: $symbol already set in fi_db"
	return	
    }

    set rc [Fi_db::Add_Plane "DEBENTURE" $symbol $strike $expdate]
    if {$rc != ""} {
	puts $rc
	Fi_db::Remove_SymbolTimed "DEBENTURE" $symbol
    }

    # There is no yield data from tmx.com and dividendinvestor.ca for
    # convertible debenture. The only yield data is from financialpost.com
    # which is data column 5 in the current line.
    set yield [lindex $line 6]
    regsub "%" $yield "" yield
    if {[string is double $yield]} {
    	Fi_db::Add_Symbol_to_Yield $symbol $yield
    }
    return
}

proc handle_warrant {line exchange} {
    if {[lindex $line 4] != $exchange} {
	return	
    }
    set symbol [lindex $line 3]
    set strike [lindex $line 5]
    regsub {US\$} $strike "" strike
    if {[string is double $strike] == 0} {
	puts "WARRANT: $symbol has invalid strike price $strike"
	return	
    }

    set rc [Fi_db::Add_Symbol_to_Timed_fi $symbol "WARRANT"]
    if {$rc == 0} {
	puts "WARRANT: $symbol not found in fi_db"
	return	
    }
    if {$rc == -1} {
	puts "WARRANT: $symbol already set in fi_db"
	return	
    }

    set expdate [clock scan [lindex $line end]]
    set rc [Fi_db::Add_Plane "WARRANT" $symbol $strike $expdate]
    if {$rc != ""} {
	puts $rc
	Fi_db::Remove_SymbolTimed "WARRANT" $symbol
    }
    return
}
