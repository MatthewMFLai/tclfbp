###########################################################
# Framework proceudres
###########################################################

proc forward_ip {p_tmpdata outport} {
	upvar $p_tmpdata tmpdata

	array set outdata {}
	port_factory_msg $outport outdata
	set outdata(symbol) $tmpdata(symbol)
	set outdata(root) "" 
	set outdata(meanings) $tmpdata(meanings)
	port_write $outport outdata
    return
}

proc forward_word_root_ip {word root outport} {

	array set outdata {}
	port_factory_msg $outport outdata
	set outdata(symbol) $word
	set outdata(root) $root 
	set outdata(meanings) ""
	port_write $outport outdata
    return
}

proc send_request {p_tmpdata word crawler outport} {
	upvar $p_tmpdata tmpdata

	array set outdata {}
	port_factory_msg $outport outdata
	set outdata(words) $word
	set outdata(crawler) $crawler
	set outdata(retry) $tmpdata(retry)
	set outdata(meanings) "" 
	
    #byRetry::set_retry $p_out 0
    return
}

proc log_word {word} {
    set fd [open /tmp/words.txt a]
    puts $fd "$word $word"
    close $fd
    return
}

proc process_imp {inport p_tmpdata} {
    global g_crawler_browse
    global g_crawler_translate
	upvar $p_tmpdata tmpdata

    set rc ""

    set crawler $tmpdata(crawler)
    if {$crawler == "translate"} {
        if {$tmpdata(meanings) != ""} {
    	    forward_ip tmpdata "OUT-1" 
    	} else {
	    send_request tmpdata $tmpdata(symbol) $g_crawler_browse "OUT-2"
    	}

    } elseif {$crawler == "stub"} { 
    	forward_ip tmpdata "OUT-1"

    } elseif {$crawler == "gutenberg"} { 
    	forward_ip tmpdata "OUT-1"

    } elseif {$crawler == "browse"} { 

    	if {[info exists tmpdata(root)]} {
   	    set word $tmpdata(symbol)

    	    set rootlist $tmpdata(root)
    	    set discard 1
    	    foreach root $rootlist {
                # root must be one word and not a phrase
		if {$root != $word &&
                    [llength $root] == 1} {
	    	    set discard 0
	    	    break
	        }
    	    }

    	    if {!$discard} {
            	# The word and root must have the same first letter.
            	if {[string index $word 0] == [string index $root 0]} {
	    	    regsub -all {\-} $root "" root
                    # Double check to make sure root not equal to word!
                    if {$root != $word} {
	    	        send_request tmpdata $root $g_crawler_translate "OUT-2"
	    	        forward_word_root_ip $word $root "OUT-1"
                    }
	    	}
    	    } else {
	    	log_word $tmpdata(symbol)
	    }
    	} else {
	    log_word $tmpdata(symbol)
	}

    }
    return $rc
}

proc process {} {

	array set msgin {}
	port_read IN-1 msgin
	process_imp IN-1 msgin
	unset msgin
	return
}

proc app_init {} {
	global argdata
    global g_crawler_translate
    global g_crawler_browse

    set g_crawler_translate [lindex $argdata(DATA) 0]
    set g_crawler_browse [lindex $argdata(DATA) 1]
    return
}

proc shutdown {} {
    return
}
