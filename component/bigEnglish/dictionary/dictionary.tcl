namespace eval txlate {

variable m_map
variable m_derived

proc trim_meanings {meanings} {
    # Custom processing specific to the Yahoo English to Chinese Dict
    # Remove the "1." from each meaning phrase.
    # Remove the square bracket contents.
    set tmp_meanings ""
    foreach meaning $meanings {
    	set index [string first "\[" $meaning]
		if {$index > 0} {
	    	set index2 [string last "\]" $meaning]
	    	set meaning [string replace $meaning $index $index2]
		}
		set index [string first " " $meaning]
		incr index
		lappend tmp_meanings [string range $meaning $index end]
    }
	
    return $tmp_meanings
}

proc init {} {
    variable m_map
    variable m_derived

    if {[info exists m_map]} {
		unset m_map
    }
    array set m_map {}
 
    if {[info exists m_derived]} {
		unset m_derived
    }
    array set m_derived {} 
    return
}

proc map_set {word meanings} {
    variable m_map

    if {$meanings == ""} {
		return
    }

    if {![info exists m_map($word)]} {
		set m_map($word) [trim_meanings $meanings]
    }
    return
}

proc map_delete {word} {
    variable m_map
    variable m_derived

    set rc ""
    if {[info exists m_map($word)]} {
		unset m_map($word)
		lappend rc $word

		foreach derived [array names m_derived] {
			if {$m_derived($derived) == $word} {
				unset m_derived($derived)
				lappend rc $derived
			}
		} 
    }
    return $rc 
}

proc map_append {word meaning} {
    variable m_map

    set rc 0
    if {$meaning == ""} {
		return $rc
    }

    if {[info exists m_map($word)]} {
		set meanings [concat $m_map($word) $meaning]
		set m_map($word) $meanings
		set rc 1
    }
    return $rc
}

proc map_set_derived {word root} {
    variable m_map
    variable m_derived

    if {[info exists m_map($root)]} {
    	set m_derived($word) $root
		return 1
    }
    return 0
}

proc map_check_word {word} {
    variable m_map
    variable m_derived

    if {[info exists m_map($word)]} {
		return MAP_WORD_ROOT 
    } elseif {[info exists m_derived($word)]} {
		return MAP_WORD_DERIVED
	} else {
		return MAP_WORD_NULL
	}
}

proc map_delete_derived {word} {
    variable m_derived

    set rc ""
    if {[info exists m_derived($word)]} {
		unset m_derived($word)
		lappend rc $word	
    } 
    return $rc 
}

proc map_get {word} {
    variable m_map
    variable m_derived

    set rc ""
    if {[info exists m_map($word)]} {
		set rc $m_map($word)
    } elseif {[info exists m_derived($word)]} {
		set root $m_derived($word)
		if {[info exists m_map($root)]} {
	    	set rc $m_map($root)
		}
    } else {

    }
	
    return $rc
}

proc map_get_words {} {
    variable m_map
    variable m_derived

    return [concat [array names m_map] [array names m_derived]] 
}

proc map_save {mapfile} {
    variable m_map
    variable m_derived

    # DEBUG
    # return
    # DEBUG END

    set fd [open $mapfile w]

	if {[array names m_map] != ""} {	
		puts $fd [array get m_map]
	}
	if {[array names m_derived] != ""} {	
		puts $fd [array get m_derived]
	}
    close $fd 
    return
}

proc map_load {mapfile} {
    variable m_map
    variable m_derived

    if {![file exists $mapfile]} {
		return
    }

    set fd [open $mapfile r]
    if {[gets $fd mapdata] > -1} {
    	if {[info exists m_map]} {
			unset m_map
    	}
    	array set m_map $mapdata
    }

    if {[gets $fd deriveddata] > -1} {
    	if {[info exists m_derived]} {
			unset m_derived
    	}
    	array set m_derived $deriveddata
    }

    close $fd
    return
}

}

###########################################################
# Framework proceudres
###########################################################
proc send_load_response {words mode outport} {

	array set outdata {}
	port_factory_msg $outport outdata
	set outdata(words) $words
	set outdata(mode) $mode
	port_write $outport outdata
    return
}

proc process_imp {inport p_tmpdata} {
    global g_to_save
    global g_chunk_count
    global g_chunk_list
    global g_filename
	upvar $p_tmpdata tmpdata

    set rc ""

    if {$inport == "IN-1"} {
		set cmd $tmpdata(cmd)
		switch -- $cmd \
	  	SAVE {
    		if {$g_to_save} {
	    		set g_to_save 0
				txlate::map_save $g_filename
    	    }
	    	port_write OUT-1 tmpdata

		} DELETE {

			set word $tmpdata(word)
			switch -- [txlate::map_check_word $word] \
	  		MAP_WORD_ROOT {
				set deletelist [txlate::map_delete $word]
				if {$deletelist != ""} {
					set g_to_save 1
					send_load_response $deletelist CACHE_DEL "OUT-2"
				}

			} MAP_WORD_DERIVED {
				set deletelist [txlate::map_delete_derived $word]
				if {$deletelist != ""} {
					set g_to_save 1 
					send_load_response $deletelist CACHE_DEL "OUT-2"
				}

			} default {
			}
			port_write OUT-1 tmpdata

		} READ {

			if {$tmpdata(meanings) == ""} {
				set word $tmpdata(word)
				set tmpdata(meanings) [txlate::map_get $word]
			}
			port_write OUT-1 tmpdata

		} UPDATE {

			set word $tmpdata(word)
			set meaning $tmpdata(meaning)
			if {[txlate::map_append $word $meaning]} {
				set g_to_save 1
			}
			port_write OUT-1 tmpdata

		} CHECK {

			set sentence $tmpdata(sentence)
			set marker $tmpdata(marker)
			set idx 0
			foreach word $sentence {
				if {[txlate::map_get $word] != ""} {
					set marker [lreplace $marker $idx $idx "WORD"]
				}
				incr idx
			}
			set tmpdata(marker) $marker
			port_write OUT-1 tmpdata

		} default {

		}

	} elseif {$inport == "IN-2"} {
		set word $tmpdata(symbol)
		if {$tmpdata(meanings) != ""} {
			set meanings [txlate::trim_meanings $tmpdata(meanings)] 
			txlate::map_set $word $meanings
			if {$meanings != ""} {
				set g_to_save 1
				send_load_response $word CACHE_SET "OUT-2"
			}
		}
		if {$tmpdata(root) != ""} {
			if {[txlate::map_set_derived $word $tmpdata(root)]} {
				send_load_response $word CACHE_SET "OUT-2"
				set g_to_save 1
			}
		}
	} else {

	}
	return $rc
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
	global env
    global g_filename
    global g_to_save

    set g_to_save 0
    set g_filename [subst [lindex $argdata(DATA) 0]]
    if {![file exists $g_filename]} {
		set fd [open $g_filename w]
		close $fd
    }
    txlate::init
    txlate::map_load $g_filename 
    
    return
}

proc kicker {datalist} {
   
    send_load_response [txlate::map_get_words] CACHE_SET "OUT-2"
    return 
}

proc shutdown {} {
    global g_filename
    global g_to_save

    if {$g_to_save} {
		txlate::map_save $g_filename
    }
}

global g_fd
global g_to_save
