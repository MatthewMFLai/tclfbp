proc process_options {url p_data} {
    upvar $p_data data

    set d_idx 0
    set call_options ""
    set put_options ""
    # Need to extract symbol name.
    set idx [string first "symbol=" $url]
    incr idx [string length "symbol="]
    set idx2 [string first "\*" $url $idx]
    incr idx2 -1
    set symbol [string range $url $idx $idx2]
    # Finish getting symbol.
    options::doit $url call_options put_options
    # Need to add a dummy idx. 
    foreach options $call_options {
    	set data($d_idx) [concat CALL $symbol $options]
	incr d_idx
    }
    foreach options $put_options {
    	set data($d_idx) [concat PUT $symbol $options]
	incr d_idx
    }
    # Kludge.
    set data(urlerror) ""
    return
}

proc init_options {arglist} {
    return
}

proc shutdown_options {} {
}
