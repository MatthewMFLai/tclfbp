namespace eval inet_if {

variable m_filter_list
variable m_words

proc init {filter} {
    variable m_filter_list
    variable m_words

    set m_filter_list $filter
    set m_words ""
 
    return
}

proc words_set {words} {
    variable m_words

    set m_words $words
    return
}

proc words_add {words} {
    variable m_words

    set m_words [concat $m_words $words]
    return
}

proc words_delete {words} {
	variable m_words

	foreach word $words {
		set idx [lsearch $m_words $word]
		if {$idx > -1} {
			set m_words [lreplace $m_words $idx $idx]
		}
	}
	return
}

proc words_check {word} {
    variable m_words

    return [lsearch $m_words $word]
}

proc word_filter_check {word} {
    variable m_filter_list

    set firstchar [string index $word 0]
    return [lsearch $m_filter_list $firstchar]
}

}

###########################################################
# Framework proceudres
###########################################################
proc ldifference {a b} {
     foreach e $b {
        set x($e) {}
     }
     set result {}
     foreach e $a {
        if {![info exists x($e)]} {
            lappend result $e
        }
     }
     return $result
}

proc forward_ip {p_tmpdata word outport} {
	upvar $p_tmpdata tmpdata

	array set outdata {}
	port_factory_msg $outport outdata
	set outdata(crawler) $tmpdata(crawler)
	set outdata(retry) $tmpdata(retry)
	set outdata(symbol) $tmpdata(symbol)
	set outdata(root) $tmpdata(root)
	set outdata(meanings) $tmpdata(meanings)
    if {$outdata(crawler) != "stub"} {
    	#set outdata(word) $word
		set outdata(meanings) "" 
    }
	port_write $outport outdata
    return
}

proc process_imp {inport p_tmpdata} {
	upvar $p_tmpdata tmpdata

    if {$inport == "IN-1"} {
		set words $tmpdata(words)
		set tmplist ""
		foreach word $words {
    	    if {[inet_if::words_check $word] > -1 || 
				[inet_if::word_filter_check $word] > -1} {
				lappend tmplist $word
	    	}
		}
		if {$tmpdata(crawler) != "stub"} {
			set tmpdata(words) [ldifference $words $tmplist]
		}
		port_write OUT-2 tmpdata

		foreach word $tmplist {
			if {[inet_if::words_check $word] == -1} {
	    		forward_ip tmpdata $word "OUT-1"
			}
		}
		#inet_if::words_add $tmplist

    } elseif {$inport == "IN-2"} {
		set words $tmpdata(words)
		set mode $tmpdata(mode)
		if {$mode == "CACHE_SET"} {
	    	inet_if::words_add $words
		} elseif {$mode == "CACHE_DEL"} {
	    	inet_if::words_delete $words
		} else {

		}
    } else {

    }
}

proc process {} {

	array set msgin {}
	set rc [port_read_once IN-1 msgin]
	if {!$rc} {
		process_imp IN-1 msgin
	}
	unset msgin

	array set msgin {}
	set rc [port_read_once IN-2 msgin]
	if {!$rc} {
		process_imp IN-2 msgin
	}
	unset msgin
	return
}

proc app_init {} {
	global argdata

    set filter [lindex $argdata(DATA) 0]
    inet_if::init $filter
    return
}

proc shutdown {} {
}
