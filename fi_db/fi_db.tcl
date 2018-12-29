# DYNAMIC SOURCE BEGIN
foreach filename [glob $env(FI_DB_HOME)/gencode/simple/*.tcl] {
    source $filename
}   
# DYNAMIC SOURCE END
# DYNAMIC SOURCE BEGIN
foreach filename [glob $env(FI_DB_HOME)/gencode/complex/*.tcl] {
    source $filename
}
# DYNAMIC SOURCE END
# DYNAMIC SOURCE BEGIN
foreach filename [glob $env(FI_DB_HOME)/gencode/dynamic_type/*.tcl] {
    source $filename
}
# DYNAMIC SOURCE END

namespace eval Fi_db {

    variable m_fi_db
    variable m_day

proc days_left {expdate} {
    variable m_day

    set rc [expr $expdate - [clock seconds]]
    set rc [expr $rc / $m_day]
    return $rc
}

proc is_derivative {symbolname} {
    if {[string first ".WT" $symbolname] > 0 ||
        [string first ".DB" $symbolname] > 0 ||
        [string first ".CALL" $symbolname] > 0 ||
        [string first ".PUT" $symbolname] > 0} {
	return 1
    } else {
	return 0
    }
}

proc Init {} {

    variable m_fi_db
    variable m_day

    # Initiailize the main object first.
    set m_fi_db [malloc::getmem]
    Assert::Assert $m_fi_db
    init_Main $m_fi_db

    # Add Warrant type object.
    set p_object [malloc::getmem]
    Assert::Assert $p_object
    init_TimedFiType $p_object
    byTimed_fi::set_type $p_object "WARRANT"
    byTimed_fi::set_call_put $p_object "CALL"
    byMain_Timed_fi::set_key $p_object "WARRANT"
    byMain_Timed_fi::add_part $m_fi_db $p_object

    # Add Debenture type object.
    set p_object [malloc::getmem]
    Assert::Assert $p_object
    init_TimedFiType $p_object
    byTimed_fi::set_type $p_object "DEBENTURE"
    byTimed_fi::set_call_put $p_object "CALL"
    byMain_Timed_fi::set_key $p_object "DEBENTURE"
    byMain_Timed_fi::add_part $m_fi_db $p_object

    # Add Debenture type object.
    set p_object [malloc::getmem]
    Assert::Assert $p_object
    init_TimedFiType $p_object
    byTimed_fi::set_type $p_object "OPTION_CALL"
    byTimed_fi::set_call_put $p_object "CALL"
    byMain_Timed_fi::set_key $p_object "OPTION_CALL"
    byMain_Timed_fi::add_part $m_fi_db $p_object

    # Add Debenture type object.
    set p_object [malloc::getmem]
    Assert::Assert $p_object
    init_TimedFiType $p_object
    byTimed_fi::set_type $p_object "OPTION_PUT"
    byTimed_fi::set_call_put $p_object "PUT"
    byMain_Timed_fi::set_key $p_object "OPTION_PUT"
    byMain_Timed_fi::add_part $m_fi_db $p_object

    set m_day [expr 3600 * 24]
    return
}

proc Handle_Sector {name} {

    variable m_fi_db
    set p_object [byMain_Sector::get_part $m_fi_db $name]
    if {$p_object == "NULL"} {
	# Create a new object.
    	set p_object [malloc::getmem]
    	Assert::Assert $p_object
	init_Sector $p_object
	byMain_Sector::set_key $p_object $name
	byMain_Sector::add_part $m_fi_db $p_object
    }
    return
}

proc Is_Company_Present {name} {

    variable m_fi_db
    set p_object [byMain_Company::get_part $m_fi_db $name]
    if {$p_object == "NULL"} {
	return 0
    } else {
    	return 1
    }
}

proc Get_Company_Symbol {name} {

    variable m_fi_db
    set p_company [byMain_Company::get_part $m_fi_db $name]
    if {[Assert::Check $p_company]} {
    	foreach p_symbol [byCompany_Symbol::get_iterator $p_company] {
	    Assert::Assert $p_symbol
	    set cur_str [bySymbol::get_symbol $p_symbol]
	    if {[is_derivative $cur_str]} {
		continue
	    }
	    return $cur_str
	}
    }
    return ""
}

proc Get_Company_Desc {name} {

    variable m_fi_db
    set p_company [byMain_Company::get_part $m_fi_db $name]
    if {[Assert::Check $p_company]} {
    	return [byCompany::get_description $p_company]
    } else {
	return ""
    }
}

proc Handle_Company {name desc} {

    variable m_fi_db
    set p_object [byMain_Company::get_part $m_fi_db $name]
    if {$p_object == "NULL"} {
	# Create a new sector object.
    	set p_object [malloc::getmem]
    	Assert::Assert $p_object
	init_Company $p_object
        byCompany::set_description $p_object $desc
	byMain_Company::set_key $p_object $name
	byMain_Company::add_part $m_fi_db $p_object
    }
    return
}

proc Handle_Metric {name} {

    variable m_fi_db
    set p_object [byMain_Metric::get_part $m_fi_db $name]
    if {$p_object == "NULL"} {
	# Create a new object.
    	set p_object [malloc::getmem]
    	Assert::Assert $p_object
	init_Metric $p_object
	byMain_Metric::set_key $p_object $name
	byMain_Metric::add_part $m_fi_db $p_object
    }
    return
}

proc Handle_IndexGrp {name} {

    variable m_fi_db
    set p_object [byMain_IndexGrp::get_part $m_fi_db $name]
    if {$p_object == "NULL"} {
	# Create a new object.
    	set p_object [malloc::getmem]
    	Assert::Assert $p_object
	init_IndexGrp $p_object
	byIndexGrp::set_description $p_object $name
	byMain_IndexGrp::set_key $p_object $name
	byMain_IndexGrp::add_part $m_fi_db $p_object
    }
    return
}

proc Handle_Index {grpname name} {

    variable m_fi_db
    set p_indexgrp [byMain_IndexGrp::get_part $m_fi_db $grpname]
    Assert::Assert $p_indexgrp

    set p_object [byIndexGrp_Index::get_part $p_indexgrp $name]
    if {$p_object == "NULL"} {
    	# Create a new object.
    	set p_object [malloc::getmem]
    	Assert::Assert $p_object
    	init_Index $p_object
    	byIndex::set_description $p_object $name
    	byIndexGrp_Index::set_key $p_object $name
    	byIndexGrp_Index::add_part $p_indexgrp $p_object
    }
    return
}

proc Find_Company {symbolname} {
    variable m_fi_db

    foreach p_company [byMain_Company::get_iterator $m_fi_db] {
	if {[byCompany_Symbol::get_part $p_company $symbolname] != "NULL"} {
	    return [byMain_Company::get_key $p_company]
	}
    }
    return ""
}

proc Find_Companys {symbollist} {
    variable m_fi_db

    set rc ""
    foreach symbolname $symbollist {
	set companyname [Find_Company $symbolname]
	if {$companyname != ""} {
	    lappend rc $companyname
	}
    }
    return $rc
}

proc Add_Symbol_to_Yield {symbolname yield} {
    variable m_fi_db
    foreach p_company [byMain_Company::get_iterator $m_fi_db] {
	Assert::Assert $p_company
	set p_symbol [byCompany_Symbol::get_part $p_company $symbolname]
	if {$p_symbol == "NULL"} {
	    continue 
	}
	# This method can be called from mutilple sources so
	# check to make sure the relationship is not set up yet.
	set key [byMain_Yield::get_key $p_symbol]
	if {$key == "" || $key == 0.00} {
	    byMain_Yield::set_key $p_symbol $yield
	    byMain_Yield::add_part $m_fi_db $p_symbol
	}
	return
    }
    return
}

proc Set_Symbol_Yield {symbolname yield yield_avg year_since} {
    variable m_fi_db
    foreach p_company [byMain_Company::get_iterator $m_fi_db] {
	Assert::Assert $p_company
	set p_symbol [byCompany_Symbol::get_part $p_company $symbolname]
	if {$p_symbol == "NULL"} {
	    continue 
	}
	bySymbol::set_dividendinvestor_yield $p_symbol $yield
	bySymbol::set_dividendinvestor_avg_yield $p_symbol $yield_avg
	bySymbol::set_yield_since $p_symbol $year_since
	return
    }
    return
}

proc Add_Company_to_Sector {companyname sectorname} {

    variable m_fi_db
    set p_sector [byMain_Sector::get_part $m_fi_db $sectorname]
    Assert::Assert $p_sector
    set p_company [byMain_Company::get_part $m_fi_db $companyname]
    Assert::Assert $p_company
    bySector_Company::set_key $p_company $companyname
    bySector_Company::add_part $p_sector $p_company
}

proc Add_Symbol_to_Company {symbolname companyname price} {

    variable m_fi_db

    set p_symbol [malloc::getmem]
    if {[is_derivative $symbolname]} {
	init_SymbolTimed $p_symbol
    } else {
	init_Symbol $p_symbol
    }
    bySymbol::set_price $p_symbol $price
    bySymbol::set_symbol $p_symbol $symbolname

    set p_company [byMain_Company::get_part $m_fi_db $companyname]
    Assert::Assert $p_company
    byCompany_Symbol::set_key $p_symbol $symbolname
    byCompany_Symbol::add_part $p_company $p_symbol
}

proc Add_Symbol_to_Metric {symbol metricname metric_val} {
    variable m_fi_db

    set p_metric [byMain_Metric::get_part $m_fi_db $metricname]
    Assert::Assert $p_metric

    set symbolfound 0
    foreach p_company [byMain_Company::get_iterator $m_fi_db] {
	set p_symbol [byCompany_Symbol::get_part $p_company $symbol]
	if {[Assert::Check $p_symbol]} {
	    set symbolfound 1
	    break
	}
    }
    if {$symbolfound == 0} {
	return
    }

    # There can only be 1 link between the metric and the company.
    # If a link is already present, do not add the new link.
    if {[byCompany_Metric::graph_get_edge $p_symbol $p_metric] != ""} {
	return
    }

    set p_link [malloc::getmem]
    init_Link $p_link
    byMetric_value::set_value $p_link $metric_val
    byMetric_Link::set_key $p_link $metric_val

    byCompany_Metric::graph_add_edge $p_symbol $p_metric $p_link
    byMetric_Link::add_part $p_metric $p_link
}

proc Add_Company_to_Metric {companyname metricname metric_val} {
    variable m_fi_db

    set p_metric [byMain_Metric::get_part $m_fi_db $metricname]
    Assert::Assert $p_metric
    set p_company [byMain_Company::get_part $m_fi_db $companyname]
    Assert::Assert $p_company

    # There can only be 1 link between the metric and the company.
    # If a link is already present, do not add the new link.
    if {[byCompany_Metric::graph_get_edge $p_company $p_metric] != ""} {
	return
    }

    set p_link [malloc::getmem]
    init_Link $p_link
    byMetric_value::set_value $p_link $metric_val
    byMetric_Link::set_key $p_link $metric_val

    byCompany_Metric::graph_add_edge $p_company $p_metric $p_link
    byMetric_Link::add_part $p_metric $p_link
}

proc Add_Company_to_Index {companyname indexgrp index} {
    variable m_fi_db

    set p_indexgrp [byMain_IndexGrp::get_part $m_fi_db $indexgrp]
    Assert::Assert $p_indexgrp
    set p_index [byIndexGrp_Index::get_part $p_indexgrp $index]
    Assert::Assert $p_index
    set p_company [byMain_Company::get_part $m_fi_db $companyname]
    Assert::Assert $p_company

    # Add the relatiion if it is not present yet.
    if {[lsearch [byCompany_Index::get_rel $p_company] $p_index] == -1} {
    	byCompany_Index::add_rel $p_company $p_index
    }
    return
}

proc Add_Symbol_to_Timed_fi {symbolname timedfitype} {
    variable m_fi_db

    set found 0
    foreach p_company [byMain_Company::get_iterator $m_fi_db] {
	Assert::Assert $p_company
	set p_symbol [byCompany_Symbol::get_part $p_company $symbolname]
	if {[Assert::Check $p_symbol]} {
	    set found 1
	    break
	}
    } 
    if {$found == 0} {
	# Cannot find the passed in derivative symbol.
	return $found
    }

    set p_head [byTimed_fi_Symbol::get_whole $p_symbol]
    if {[Assert::Check $p_head]} {
	# Derivative already present in link list.
	return -1
    }
    set p_head [byMain_Timed_fi::get_part $m_fi_db $timedfitype]
    Assert::Assert $p_head
    byTimed_fi_Symbol::set_key $p_symbol $symbolname
    byTimed_fi_Symbol::add_part $p_head $p_symbol

    return 1
}

proc Add_Plane {timedfitype symbol strike expdate} {
    variable m_fi_db

    # Find the derivative symbol object first.
    set p_head [byMain_Timed_fi::get_part $m_fi_db $timedfitype]
    Assert::Assert $p_head
    set p_symboltimed [byTimed_fi_Symbol::get_part $p_head $symbol]
    if {[Assert::Check $p_symboltimed] == 0} {
	return "Derivative symbol $symbol not found"
    }
   
    # Get the primary symbol.
    set symbol_str [lindex [split $symbol "."] 0]
    set p_company [byCompany_Symbol::get_whole $p_symboltimed]
    set symbol_found 0    
    Assert::Assert $p_company
    foreach p_symbol [byCompany_Symbol::get_iterator $p_company] {
	Assert::Assert $p_symbol
	set cur_str [bySymbol::get_symbol $p_symbol]
	if {[is_derivative $cur_str]} {
	    continue
	}
    	set symbol_found 1
	break
    }
    if {$symbol_found == 0} {
	return "Primary symbol not found: $symbol_str"
    }

    # Make sure primary symbol share price is valid.

    set price [bySymbol::get_price $p_symbol]
    if {![string is double $price]} {
    	set symbolstr [bySymbol::get_symbol $p_symbol]
	return "Primay symbol $symbolstr share price $price is invalid"
    }
    # Find/create strike price object.
    set p_strike [byMain_Strike::get_part $m_fi_db $strike]
    if {[Assert::Check $p_strike] == 0} {
    	set p_strike [malloc::getmem]
	init_Strike $p_strike
	byStrike::set_strike_price $p_strike $strike
	byMain_Strike::set_key $p_strike $strike
	byMain_Strike::add_part $m_fi_db $p_strike
    }

    # Find/create expiry time object.
    set p_expdate [byMain_Date::get_part $m_fi_db $expdate]
    if {[Assert::Check $p_expdate] == 0} {
    	set p_expdate [malloc::getmem]
	init_Date $p_expdate
	byDate::set_date $p_expdate $expdate
	byMain_Date::set_key $p_expdate $expdate
	byMain_Date::add_part $m_fi_db $p_expdate
    }

    # Add the plane. Vertex 1 is for primary symbol,
    # vertex 2 for strike price object, vertex 3 for expiry date object.
    byDerivative::add_plane $p_symbol $p_strike $p_expdate $p_symboltimed
    return ""
}

# The Remove_SymbolTimed procedure should be called to
# remove the symboltimed object from the link list
# if the calling routine detects the strike price is invalid.
proc Remove_SymbolTimed {timedfitype symbol} {
    variable m_fi_db

    set p_head [byMain_Timed_fi::get_part $m_fi_db $timedfitype]
    Assert::Assert $p_head
    set p_symboltimed [byTimed_fi_Symbol::get_part $p_head $symbol]
    Assert::Assert $p_symboltimed
    byTimed_fi_Symbol::remove_part $p_head $p_symboltimed
    return
}

proc Get_Company_All {} {
    variable m_fi_db

    set result ""
    foreach p_object [byMain_Company::get_iterator $m_fi_db] {
    	Assert::Assert $p_object
	set desc [byCompany::get_description $p_object]
	lappend result [list [byMain_Company::get_key $p_object] $desc]
    }
    return $result
}

proc Get_Company_by_Sector {sector} {
    variable m_fi_db

    set result ""
    set p_sector [byMain_Sector::get_part $m_fi_db $sector]
    if {[Assert::Check $p_sector]} { 
    	foreach p_object [bySector_Company::get_iterator $p_sector] {
	    Assert::Assert $p_object
	    lappend result [byMain_Company::get_key $p_object]
        }
    }
    return $result
}

proc Get_Company_by_Symbols {symbollist} {
    set symbollist [string toupper $symbollist]
    return [Find_Companys $symbollist] 
}

proc Get_Company_by_Metric {metric val_low val_high} {
    variable m_fi_db

    if {$metric == "Price Change"} {
	return [Get_Company_by_Change $val_low $val_high]
    } elseif {$metric == "Volume"} {
	return [Get_Company_by_Volume $val_low $val_high]
    } else {
	# Normal processing.
    }

    set result ""
    set p_metric [byMain_Metric::get_part $m_fi_db $metric]
    if {[Assert::Check $p_metric] == 0} {
	return $result
    }
 
    foreach p_link [byMetric_Link::get_iterator $p_metric] {
	Assert::Assert $p_link
	set p_company [byCompany_Metric::graph_get_vertex_from $p_link]
	Assert::Assert $p_company
	set value [byMetric_value::get_value $p_link]
	if {$value >= $val_low &&
            $value <= $val_high} {
	    lappend result [byMain_Company::get_key $p_company]
	}
    }

    return $result
}

proc Get_Company_by_Metric_Compare {metric metric2} {
    variable m_fi_db

    set rc ""
    set p_metric [byMain_Metric::get_part $m_fi_db $metric]
    if {![Assert::Check $p_metric]} {
	return $rc
    }
    set p_metric2 [byMain_Metric::get_part $m_fi_db $metric2]
    if {![Assert::Check $p_metric2]} {
	return $rc
    }
    foreach p_company [byMain_Company::get_iterator $m_fi_db] {
	Assert::Assert $p_company
    	set p_link [byCompany_Metric::graph_get_edge $p_company $p_metric]
	if {![Assert::Check $p_link]} {
	    continue
	}
    	set p_link2 [byCompany_Metric::graph_get_edge $p_company $p_metric2]
	if {![Assert::Check $p_link2]} {
	    continue
	}
        if {[byMetric_value::get_value $p_link] < [byMetric_value::get_value $p_link2]} {
	    lappend rc [byMain_Company::get_key $p_company]
	}
    }
    return $rc 
}

proc get_company_by_symbol_metric {val_low val_high metric} {
    variable m_fi_db

    set result ""
    set p_metric [byMain_Metric::get_part $m_fi_db $metric]
    if {[Assert::Check $p_metric] == 0} {
	return $result
    }
 
    foreach p_link [byMetric_Link::get_iterator $p_metric] {
	Assert::Assert $p_link
	set p_symbol [byCompany_Metric::graph_get_vertex_from $p_link]
	Assert::Assert $p_symbol
	set value [byMetric_value::get_value $p_link]
	if {$value >= $val_low &&
            $value <= $val_high} {
	    set p_company [byCompany_Symbol::get_whole $p_symbol]
	    Assert::Assert $p_company
	    lappend result [byMain_Company::get_key $p_company]
	}
    }

    set result [lsort -unique $result]
    return $result
}

proc get_symbol_metric_value {symbolname metricname} {
    variable m_fi_db

    set rc ""
    set p_metric [byMain_Metric::get_part $m_fi_db $metricname]
    if {[Assert::Check $p_metric] == 0} {
	return $rc 
    }

    foreach p_company [byMain_Company::get_iterator $m_fi_db] {
	Assert::Assert $p_company
	set p_symbol [byCompany_Symbol::get_part $p_company $symbolname]
	if {![Assert::Check $p_symbol]} {
	    continue 
	}
	set p_link [byCompany_Metric::graph_get_edge $p_symbol $p_metric]
	if {[Assert::Check $p_link]} {
    	    set rc [byMetric_Link::get_key $p_link]
	}
	break	
    }
    return $rc
}

proc Get_Company_by_Change {val_low val_high} {
    return [get_company_by_symbol_metric $val_low $val_high "Price Change"] 
}

proc Get_Company_by_Volume {val_low val_high} {
    return [get_company_by_symbol_metric $val_low $val_high "Volume"] 
}

proc Get_Company_by_Yield {val_low val_high {matchstr ""}} {
    variable m_fi_db

    set result ""
    foreach p_object [byMain_Yield::get_iterator $m_fi_db] {
	Assert::Assert $p_object
	set symbol [byCompany_Symbol::get_key $p_object]
	if {$matchstr != ""} {
	    if {[string first $matchstr $symbol] == -1} {
		continue
	    }
	}
	set yield [byMain_Yield::get_key $p_object]
	if {$yield >= $val_low &&
            $yield <= $val_high} {
	    lappend result [Find_Company $symbol]
	}
    }
    return [lsort -unique $result]
}

proc Get_Company_by_Derivative {timedfitype} {
    variable m_fi_db

    set result ""
    set p_head [byMain_Timed_fi::get_part $m_fi_db $timedfitype]
    Assert::Assert $p_head
    foreach p_object [byTimed_fi_Symbol::get_iterator $p_head] {
	Assert::Assert $p_object
	set p_company [byCompany_Symbol::get_whole $p_object]
	Assert::Assert $p_company
	lappend result [byMain_Company::get_key $p_company]
    }
    return [lsort -unique $result]
}

proc Get_Company_by_Index {indexgrp index} {
    variable m_fi_db

    set p_indexgrp [byMain_IndexGrp::get_part $m_fi_db $indexgrp]
    Assert::Assert $p_indexgrp
    set p_index [byIndexGrp_Index::get_part $p_indexgrp $index]
    Assert::Assert $p_index
    set rc ""
    foreach p_company [byCompany_Index::get_rel $p_index] {
	Assert::Assert $p_company
	lappend rc [byMain_Company::get_key $p_company]
    }
    return $rc
}

proc Get_Company_by_Expdate {timedfitype low high} {
    variable m_fi_db

    set p_head [byMain_Timed_fi::get_part $m_fi_db $timedfitype]
    Assert::Assert $p_head

    set rc ""
    foreach p_expdate [byMain_Date::get_iterator $m_fi_db] {
	Assert::Assert $p_expdate
	set timeleft [days_left [byDate::get_date $p_expdate]]
	if {$low <= $timeleft && $timeleft <= $high} {
	    foreach p_symboltimed [byDerivative::get_plane_iterator $p_expdate] {
		Assert::Assert $p_symboltimed
	    	if {[byTimed_fi_Symbol::get_whole $p_symboltimed] != $p_head} {
		    continue
	    	}
		set p_company [byCompany_Symbol::get_whole $p_symboltimed]
		Assert::Assert $p_company
		lappend rc [byMain_Company::get_key $p_company]
	    }
	}
    }
    return $rc
}

proc get_derivative {p_rc timedfitype} {
    variable m_fi_db
    upvar $p_rc rc

    # Return the % price difference from strike price and
    # number of days till expiration.

    set rc ""
    array set tmptable {}
    set p_head [byMain_Timed_fi::get_part $m_fi_db $timedfitype]
    Assert::Assert $p_head
    foreach p_symboltimed [byTimed_fi_Symbol::get_iterator $p_head] {
	set p_symbol [byDerivative::get_vertex_1 $p_symboltimed]
	Assert::Assert $p_symbol
	set p_strike [byDerivative::get_vertex_2 $p_symboltimed]
	Assert::Assert $p_strike
	set p_expdate [byDerivative::get_vertex_3 $p_symboltimed]
	Assert::Assert $p_expdate
	set p_company [byCompany_Symbol::get_whole $p_symboltimed]
	Assert::Assert $p_company

	set price [bySymbol::get_price $p_symbol]
	set strikeprice [byStrike::get_strike_price $p_strike]
	set delta [expr 100 * ($price - $strikeprice) / $strikeprice]
	set delta [format "%.2f" $delta]
	set datestr [byDate::get_date $p_expdate]
	set timeleft [days_left $datestr]
	if {[info exists tmptable($delta)] == 0} {
	    set tmptable($delta) ""
	}
	lappend tmptable($delta) "[bySymbol::get_symbol $p_symboltimed] $timeleft [byMain_Company::get_key $p_company]"
    }

    foreach delta [lsort -real [array names tmptable]] {
	foreach row $tmptable($delta) {
	    set symbolstr [lindex $row 0]
	    set timeleft [lindex $row 1]
	    set companystr [lrange $row 2 end]
	    lappend rc "$symbolstr $delta $timeleft $companystr"
	}
    }
    return
}

proc Get_Company_by_Intrinsic {timedfitype low high} {
    set rc ""
    set datalist ""
    get_derivative datalist $timedfitype
    foreach row $datalist {
	set delta [lindex $row 1]
	if {$low <= $delta && $delta <= $high} {
	    lappend rc [lrange $row 3 end]
	}
    }
    return $rc
}

proc Get_Company_by_Intrinsic_Expdate {timedfitype low high day_low day_high} {
    set rc ""
    set datalist ""
    get_derivative datalist $timedfitype
    foreach row $datalist {
	set delta [lindex $row 1]
	set dayleft [lindex $row 2]
	if {$low <= $delta && $delta <= $high &&
            $day_low <= $dayleft && $dayleft <= $day_high} {
	    lappend rc [lrange $row 3 end]
	}
    }
    return $rc
}

proc Dump_Derivative {fd timedfitype {metriclist ""}} {

    set datalist ""
    get_derivative datalist $timedfitype
    puts $fd $timedfitype
    foreach row $datalist {
	set symbolname [lindex $row 0]
	foreach metric $metriclist {
	    lappend row [get_symbol_metric_value $symbolname $metric]
	}
	puts $fd $row
    }
    return
}

proc Dump_Sector {fd} {
    variable m_fi_db

    foreach p_object [byMain_Sector::get_iterator $m_fi_db] {
	Assert::Assert $p_object
	puts $fd [byMain_Sector::get_key $p_object]
    }
    return
}

proc Dump_Company {fd} {
    variable m_fi_db

    foreach p_sector [byMain_Sector::get_iterator $m_fi_db] {
	Assert::Assert $p_sector
    	set numofcompany [llength [bySector_Company::get_iterator $p_sector]]
	puts $fd "[byMain_Sector::get_key $p_sector] ($numofcompany)"
    	foreach p_object [bySector_Company::get_iterator $p_sector] {
	    Assert::Assert $p_object
	    set symbollist ""
	    foreach p_symbol [byCompany_Symbol::get_iterator $p_object] {
		lappend symbollist [byCompany_Symbol::get_key $p_symbol]
	    }
	    puts $fd "[byMain_Company::get_key $p_object] $symbollist"
        }
    }
    return
}

proc Dump_Metric {fd} {
    variable m_fi_db

    foreach p_object [byMain_Metric::get_iterator $m_fi_db] {
	Assert::Assert $p_object
	puts $fd [byMetric::get_name $p_object]
    }
    return
}

proc Dump_Metric_Link {fd metricname} {
    variable m_fi_db

    set p_metric [byMain_Metric::get_part $m_fi_db $metricname]
    Assert::Assert $p_metric

    foreach p_link [byMetric_Link::get_iterator $p_metric] {
	Assert::Assert $p_link
	set p_object [byCompany_Metric::graph_get_vertex_from $p_link]
	Assert::Assert $p_object
	if {$metricname != "Price Change" &&
            $metricname != "Volume"} {
	    puts $fd "[byMetric_value::get_value $p_link] [byMain_Company::get_key $p_object]"
	} else {
	    puts $fd "[byMetric_value::get_value $p_link] [bySymbol::get_symbol $p_object]"
	}
    }
    return
}

proc Dump_Yield {fd} {
    variable m_fi_db

    foreach p_object [byMain_Yield::get_iterator $m_fi_db] {
	Assert::Assert $p_object
	set symbol [byCompany_Symbol::get_key $p_object]
	set yield [byMain_Yield::get_key $p_object]
	set di_yield [bySymbol::get_dividendinvestor_yield $p_object]
	set di_yield_avg [bySymbol::get_dividendinvestor_avg_yield $p_object]
	set year_since [bySymbol::get_yield_since $p_object]
	puts $fd "$symbol $yield $di_yield $di_yield_avg $year_since"
    }
    return
}

proc Dump_Expdate {fd timedfitype} {
    variable m_fi_db

    set p_head [byMain_Timed_fi::get_part $m_fi_db $timedfitype]
    Assert::Assert $p_head

    foreach p_expdate [byMain_Date::get_iterator $m_fi_db] {
	Assert::Assert $p_expdate
	set rc ""
	lappend rc [days_left [byDate::get_date $p_expdate]]
	set cnt 0
	foreach p_symboltimed [byDerivative::get_plane_iterator $p_expdate] {
	    Assert::Assert $p_symboltimed
	    if {[byTimed_fi_Symbol::get_whole $p_symboltimed] != $p_head} {
		continue
	    }

	    set p_company [byCompany_Symbol::get_whole $p_symboltimed]
	    Assert::Assert $p_company
	    set name [byMain_Company::get_key $p_company]
	    if {[lsearch $rc $name] == -1} {
	    	lappend rc [byMain_Company::get_key $p_company]
	    	incr cnt
	    }
	}
	if {$cnt} {
	    puts $fd $rc
	}
    }
}

proc Dump_All {filename} {
    variable m_fi_db

    set fd [open $filename w]
    Dump_Yield $fd
    puts $fd "------"
    Dump_Sector $fd
    puts $fd "------"
    Dump_Company $fd
    puts $fd "------"
 
    foreach p_object [byMain_Metric::get_iterator $m_fi_db] {
	Assert::Assert $p_object
	puts $fd [byMain_Metric::get_key  $p_object]
	Dump_Metric_Link $fd [byMain_Metric::get_key $p_object]
    	puts $fd "------"
    }
    set metriclist {{Price Change} Volume}
    Dump_Derivative $fd "WARRANT" $metriclist
    puts $fd "------"
    Dump_Expdate $fd "WARRANT"
    puts $fd "------"
    Dump_Derivative $fd "DEBENTURE" $metriclist
    puts $fd "------"
    Dump_Expdate $fd "DEBENTURE"
    puts $fd "------"
    Dump_Derivative $fd "OPTION_CALL"
    puts $fd "------"
    Dump_Expdate $fd "OPTION_CALL"
    puts $fd "------"
    Dump_Derivative $fd "OPTION_PUT"
    puts $fd "------"
    Dump_Expdate $fd "OPTION_PUT"
    puts $fd "------"
    close $fd
}

proc Dump_Company_Metric {symbol} {
    variable m_fi_db

    set companyname [Fi_db::Find_Company $symbol]
    if {$companyname == ""} {
	return	
    }
    set rc ""
    set p_company [byMain_Company::get_part $m_fi_db $companyname]
    Assert::Assert $p_company
    puts [byMain_Company::get_key $p_company]
    foreach p_link [byCompany_Metric::graph_get_from_iterator $p_company] {
	set p_metric [byCompany_Metric::graph_get_vertex_to $p_link]
	Assert::Assert $p_metric
	set value [byMetric_value::get_value $p_link]
    	set name [byMain_Metric::get_key $p_metric]
	lappend rc [list $name $value]	
    }
    return $rc
}

proc Order_By_Metric {companylist metricname} {
    variable m_fi_db

    set rc ""
    set p_metric [byMain_Metric::get_part $m_fi_db $metricname]
    if {![Assert::Check $p_metric]} {
	return $rc
    }

    foreach p_link [byMetric_Link::get_iterator $p_metric] {
	Assert::Assert $p_link
	set p_object [byCompany_Metric::graph_get_vertex_from $p_link]
	Assert::Assert $p_object
	if {$metricname != "Price Change" &&
            $metricname != "Volume"} {
	    set key [byMain_Company::get_key $p_object]
	} else {
	    set key [bySymbol::get_symbol $p_object]
	}
	if {[lsearch $companylist $key] > -1} {
	    lappend rc $key
	}
    }
    return $rc
}

proc Save {filename} {
    variable m_fi_db
    malloc::set_var fi_db $m_fi_db
    malloc::save $filename
}

proc Load {filename} {
    variable m_fi_db
    variable m_day

    malloc::restore $filename
    set m_fi_db [malloc::get_var fi_db]
    set m_day [expr 3600 * 24]
}

}
