proc get_primary {symbol p_primary p_suffix} {
    global g_derivative_suffix
    upvar $p_primary primary_symbol
    upvar $p_suffix suffix_symbol 

    set primary_symbol ""
    set suffix_symbol ""
    foreach suffix $g_derivative_suffix {
	set idx [string first $suffix $symbol]
	if {$idx == -1} {
	    continue
	}
	incr idx -1
	set primary_symbol [string range $symbol 0 $idx]
	incr idx
	set suffix_symbol [string range $symbol $idx end]
	break
    }
    return
}

# Partial match done here eg. if symbol is edv.wt.a
# and suffix is .wt, then the match returns true.
proc is_derivative {symbol} {
    global g_derivative_suffix

    set rc 0
    foreach suffix $g_derivative_suffix {
	if {[string first $suffix $symbol] > 0} {
	    set rc 1
	    break
	}
    }
    return $rc
}

proc pool_add {symbol} {
    global g_derivative_pool
    global g_derivative_suffix

    get_primary $symbol primary_symbol suffix_symbol
    if {![info exists g_derivative_pool($primary_symbol)]} {
	set g_derivative_pool($primary_symbol) ""
    }
    lappend g_derivative_pool($primary_symbol) $suffix_symbol
    return
}

# The symbol passed in is ALWAYS primary. It cannot be a 
# derivative symbol. The returned list consists of deriative
# symbols.
proc pool_remove {symbol} {
    global g_derivative_pool

    set rc ""
    if {![info exists g_derivative_pool($symbol)]} {
	return $rc 
    }
    foreach suffix $g_derivative_pool($symbol) {
	lappend rc $symbol$suffix
    }
    unset g_derivative_pool($symbol)
    return $rc    
}

proc send_stored_ip {symbol} {
    global g_symbol

    if {[info exists g_symbol($symbol,ABSENT)]} {
    	foreach p_ip $g_symbol($symbol,ABSENT) {
    	    server_send $p_ip OUT-0
   	    ip::sink $p_ip 
    	}
    	unset g_symbol($symbol,ABSENT)
    }
}

proc process {inport p_ip} {
    global g_server_id
    global g_symbol
   
    set rc "" 
    array set data [byList::get_list $p_ip]
    set server_id $g_server_id 
    # Insert the inport data into the request data.
    byMux::add_key $p_ip $server_id $inport
    if {[string first "financial" $inport] > -1} {
    	server_send $p_ip OUT-0

	set symbol $data(f_Symbol)
	if {[is_derivative $symbol]} {
	    get_primary $symbol primary_symbol xxx
	    if {![info exists g_symbol($primary_symbol,PRESENT)]} {
	        # Current symbol is derivative, primary sysmbol notr
	        # yet received.
		pool_add $symbol
	    } else {
	        # Current symbol is derivative, primary sysmbol received 
    		set g_symbol($symbol,PRESENT) 1
		send_stored_ip $symbol
	    }
	} else {
    	    set g_symbol($symbol,PRESENT) 1
	    send_stored_ip $symbol
	    # Check if any derivative symbol in the derivative pool.
	    # If found, remove them from pool and send their stored
	    # ip out.
	    foreach stored_symbol [pool_remove $symbol] {
    		set g_symbol($stored_symbol,PRESENT) 1
	    	send_stored_ip $stored_symbol
	    }
	}
    } else {
    	if {[string first "fundamental" $inport] > -1} {
	    set symbol $data(fundamental_symbol)
	} elseif {[string first "dividend" $inport] > -1} {
	    set symbol $data(symbol)
	} elseif {[string first "options" $inport] > -1} {
	    set symbol [lindex $data(line) 1]
	} elseif {[string first "warrant" $inport] > -1} {
	    set symbol [lindex $data(line) 3]
	} elseif {[string first "debenture" $inport] > -1} {
	    set symbol [lindex $data(line) 1]
	} else {
	    server_log ERROR "inport $inport not recognized"
    	    unset data
	    return $rc
	}

	if {[info exists g_symbol($symbol,PRESENT)]} {
    	    server_send $p_ip OUT-0
	} else {
	    if {[info exists g_symbol($symbol,ABSENT)] == 0} {
		set g_symbol($symbol,ABSENT) ""
	    }
	    lappend g_symbol($symbol,ABSENT) [ip::clone $p_ip]
	}	
    }
    unset data
    return $rc
}

proc init {datalist} {
    global g_server_id
    global g_symbol
    global g_derivative_suffix
    global g_derivative_pool

    set g_server_id [lindex $datalist 0]
    set g_derivative_suffix [lindex $datalist 1]
    array set g_derivative_pool {} 
    array set g_symbol {}
    return
}

proc shutdown {} {
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
variable g_symbol
