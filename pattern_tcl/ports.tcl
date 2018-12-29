# Substitue <assoc> with the name of the
# pattern instance.
# Substitue <whole> and <part> with the
# names of the application structures.
proc set_ports {p_ports portlist} {
    upvar #0 $p_ports ports 

    # portlist must have one of the following formats
    # {IN/OUT/INIT-<port #> <socket port #> IN/OUT/INIT-<port #> <socket port #> ...}
    foreach {portname portvalue} $portlist {
	if {[string first "IN-" $portname] == -1 &&
	    [string first "OUT-" $portname] == -1 &&
	    [string first "INIT-" $portname] == -1} {
	    puts "Port name $portname is not supported."
	    continue
	}
	set idx [string first "-" $portname]
	incr idx -1
	set key [string range $portname 0 $idx]
	switch -- $key {
	    IN {
		set portidx [lsearch $ports(&IN) $portname]
		if {$portidx == -1} { 
    		    lappend ports(&IN) $portname
		    lappend ports(&IN) $portvalue
		} else {
		    incr portidx
		    set ports(&IN) [lreplace $ports(&IN) $portidx $portidx $portvalue]
		}
	    } 
	    OUT {
		set portidx [lsearch $ports(&OUT) $portname]
		if {$portidx == -1} { 
    		    lappend ports(&OUT) $portname
		    lappend ports(&OUT) $portvalue
		} else {
		    incr portidx
		    set ports(&OUT) [lreplace $ports(&OUT) $portidx $portidx $portvalue]
		}
	    } 
	    INIT {
		set portidx [lsearch $ports(&INIT) $portname]
		if {$portidx == -1} { 
    		    lappend ports(&INIT) $portname
		    lappend ports(&INIT) $portvalue
		} else {
		    incr portidx
		    set ports(&INIT) [lreplace $ports(&INIT) $portidx $portidx $portvalue]
		}
	    }
	}
    }
}

proc get_port {p_ports portname} {
    upvar #0 $p_ports ports 
    set portvalue ""

    # portname must have one of the following formats
    # IN/OUT/INIT-<port #>
    if {[string first "IN-" $portname] == -1 &&
    	[string first "OUT-" $portname] == -1 &&
    	[string first "INIT-" $portname] == -1} {
    	puts "Port name $portname is not supported."
	return $portvalue 
    }
    set idx [string first "-" $portname]
    incr idx -1
    set key [string range $portname 0 $idx]
    switch -- $key {
   	IN {
	    set portidx [lsearch $ports(&IN) $portname]
	    if {$portidx > -1} { 
		incr portidx
	    	set portvalue [lindex $ports(&IN) $portidx]
	    }
    	} 
	OUT {
	    set portidx [lsearch $ports(&OUT) $portname]
	    if {$portidx > -1} { 
		incr portidx
		set portvalue [lindex $ports(&OUT) $portidx]
	    }
	} 
	INIT {
	    set portidx [lsearch $ports(&INIT) $portname]
	    if {$portidx > -1} { 
	    	incr portidx
	    	set portvalue [lindex $ports(&INIT) $portidx]
	    }
    	}
    }
    return $portvalue
}

proc init_ports {p_ports} {
    upvar #0 $p_ports ports 
    set ports(&IN) ""
    set ports(&OUT) ""
    set ports(&INIT) ""
}
