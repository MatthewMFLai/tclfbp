proc process_query {p_ip} {
    global g_exchange

    set rc ""
    foreach line [byList::get_list $p_ip] {
    	set cmd Fi_db::Get_Company_by_[lindex $line 0]
    	set data [lrange $line 1 end]
    	puts "$cmd $data"
    	set result [eval $cmd $data]
	set symbollist ""
	foreach company $result {
	    set symbol [Fi_db::Get_Company_Symbol $company]
	    if {$symbol == ""} {
	    	continue 
	    }
	    lappend symbollist $symbol
    	}	    
	lappend rc [list filter_arg $line result $symbollist exchange $g_exchange]
    }
    set p_out [ip::source]
    byList::init $p_out
    byList::set_list $p_out $rc
    server_send $p_out OUT-1
    ip::sink $p_out

    return
}

proc process {inport p_ip} {
    global g_server_id
    global g_financials_metrics
    global g_indexgrp
    global g_companylist
    global g_exchange

    set rc ""
    # Check for query first.
    if {[string first "query" $inport] > 0} {
	process_query $p_ip
	return $rc
    }
    
    set srctype [byMux::get_key $p_ip $g_server_id]
    byMux::remove_key $p_ip $g_server_id

    array set data [byList::get_list $p_ip]
    if {[string first "financial" $srctype] > -1 } {
	unset data(urlerror)
	set lines ""
    	foreach idx [array names data] {
	    lappend lines "$idx $data($idx)"
    	}
    	lappend lines "---------------"

	if {$g_financials_metrics == 0} {
	    create_financials_metrics $lines
	    set g_financials_metrics 1
	}
	set company [handle_financials $lines]
	if {[lsearch $g_companylist $company] == -1} {
	    lappend g_companylist $company
	    set desc [Fi_db::Get_Company_Desc $company]
	    if {$desc != ""} {
	        # Apply indexing to company name and description.
    	    	foreach indexgrp [array names g_indexgrp] {
	    	    set indexlist $g_indexgrp($indexgrp)
	    	    foreach index [lunion [gen_index $indexlist $desc] \
                                  [gen_index $indexlist $company]] {
	    	    	Fi_db::Add_Company_to_Index $company $indexgrp $index
	    	    }
   	    	}
	    }
	}

    } elseif {[string first "fundamental" $srctype] > -1 } {
    	set line ""
    	append line "$data(fundamental_symbol) "
    	append line "$data(P/E) "
    	append line "$data(Yield) "
    	set idx "Market Cap"
    	append line "$data($idx) "
    	append line "$data(Change:) "
    	append line $data(Volume:)
	handle_fundamental $line

    } elseif {[string first "dividend" $srctype] > -1 } {
    	set line ""
    	append line "$data(symbol) "
    	append line "$data(yield) "
    	append line "$data(yield5yr) "
    	append line $data(paidsince)
	handle_dividend $line

    } elseif {[string first "options" $srctype] > -1 } {
    	set line $data(line) 
	handle_option $line

    } elseif {[string first "warrant" $srctype] > -1 } {
    	set line $data(line) 
	handle_warrant $line $g_exchange

    } elseif {[string first "debenture" $srctype] > -1 } {
    	set line $data(line) 
	handle_debenture $line

    } else {
	server_log ERROR "inport $inport not recognized"
	unset data
	return $rc
    }
    unset data
    return $rc
}

proc init {datalist} {
    global g_server_id
    global g_filename
    global g_report
    global g_financials_metrics
    global g_exchange
    global g_indexgrp
    global g_companylist
    global env

    set g_server_id [lindex $datalist 0]
    set g_filename [lindex $datalist 1]
    set g_report [lindex $datalist 2]
    set g_exchange [lindex $datalist 3]
    set g_financials_metrics 0
    set g_companylist ""

    Assert::Init 0

    set loaded 0
    if {[file exists $g_filename]} {
	Fi_db::Load $g_filename
	set loaded 1
    } else {

    	Fi_db::Init
    	Financial_Parser::Init

    	Fi_db::Handle_Metric "PE"
    	Fi_db::Handle_Metric "Market Cap"
    	Fi_db::Handle_Metric "Price Change"
    	Fi_db::Handle_Metric "Volume"
    }
 
    # Get the data files containing regexp match patterns.
    foreach infile [glob $env(FI_DB_HOME)/util/*.dat] {
    	set fd [open $infile r]
    	gets $fd indexlist
    	close $fd

    	if {$indexlist == ""} {
	    continue
    	}

    	# Create index group.
    	set indexgrp [lindex [split $infile "/"] end]
    	set indexgrp [lindex [split $indexgrp "."] 0]
	if {$loaded == 0} {
    	    Fi_db::Handle_IndexGrp $indexgrp
    	    foreach index $indexlist {
	    	Fi_db::Handle_Index $indexgrp $index
    	    }
	}
    	set g_indexgrp($indexgrp) $indexlist	
    }
    return
}

proc shutdown {} {
    global g_filename
    global g_report
    Fi_db::Save $g_filename
    Fi_db::Dump_All $g_report
    return
}

# Need to source in other tcl scripts in the same directory.
# The following trick to retrieve the current subdirectory
# should work.
#set scriptname [info script]
#regsub "mux.tcl" $scriptname "ZZZ" scriptname
#regsub "ZZZ" $scriptname "byMux.tcl" script2 
#source $script2 
source $env(COMP_HOME)/ip/byMux.tcl
source $env(COMP_HOME)/ip2/byList.tcl
source $env(FI_DB_HOME)/fi_db.tcl
source $env(FI_DB_HOME)/fi_db_test_imp.tcl
source $env(FI_DB_HOME)/util/assert.tcl
source $env(FI_DB_HOME)/util/index.tcl
source $env(FI_DB_HOME)/util/set.tcl
source $env(FI_DB_HOME)/parse_financials.tcl
source $env(PATTERN_HOME)/time_util.tcl
variable g_symbol
