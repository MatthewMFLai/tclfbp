package require Tk

  frame  .f1     ;# Frame for button
  frame  .f2     ;# Frame for input
  frame  .f3     ;# Frame for output

  label  .labA -text "Word:"
  label  .labB -text "Meaning:"
  label  .labC -text "Derived:"
 
  entry  .entA -textvar A -width 11
  entry  .entB -textvar B -width 11
  entry  .entC -textvar C -width 11
 
  button .get -text "GET" -command {
    send_request $A "OUT-1"
    server_async_send ""
  }
 
  button .set -text "SET" -command {
    send_populate_request $A "OUT-2"
    server_async_send ""
  }
 
  button .define -text "DEFINE" -command {
    send_define_request $A $B "OUT-2"
    server_async_send ""
  }
  
  button .update -text "UPDATE" -command {
    send_update $A $B "OUT-1"
    server_async_send ""
  }

  button .map -text "MAP" -command {
    send_map_request $A $C "OUT-2"
    server_async_send ""
  }
  
  button .save -text "SAVE" -command {
    send_save "OUT-1"
    server_async_send ""
  }
  
  button .add -text "ADD" -command {

    if {$A != "" && $C != "" && $A != $C} {
    	set_update_word $A $C 
    	set root [get_root]
    	send_request $root "OUT-1"
    	set_state FSM_CHECK_ROOT
    	server_async_send ""
    	.f3.list delete 0 end
    	.f3.list insert end "[get_state] check root: $root"
    }
  }

  button .add2 -text "ADD*" -command {

    set filename [tk_getOpenFile]
    set_update_words $filename 
    set root [get_root]
    send_request $root "OUT-1"
    set_state FSM_CHECK_ROOT
    server_async_send ""
    .f3.list delete 0 end
    .f3.list insert end "[get_state] check root: $root" 
  }
  
  button .delete -text "DEL" -command {
    send_delete_request $A $C "OUT-1"
    server_async_send ""
  }
  
  pack   .f1 .f2 .f3

  pack   .get         -in .f1  -side left
  pack   .set         -in .f1  -side left
  pack   .define      -in .f1  -side left
  pack   .update      -in .f1  -side left
  pack   .map         -in .f1  -side left
  pack   .save        -in .f1  -side left
  pack   .add         -in .f1  -side left
  pack   .add2        -in .f1  -side left
  pack   .delete      -in .f1  -side left
  pack   .labA .entA  -in .f2  -side left 
  pack   .labB .entB  -in .f2  -side left
  pack   .labC .entC  -in .f2  -side left

scrollbar .f3.scroll -command ".f3.list yview"
listbox .f3.list -yscroll ".f3.scroll set" \
	-width 25 -height 8 -setgrid 1
pack .f3.list .f3.scroll -side left -fill y -expand 1


###########################################################
# Framework proceudres
###########################################################

proc send_request {word outport {queued 1}} {

	array set msgout {}
	port_factory_msg $outport msgout
	array set msgout "word $word cmd READ meanings {}"
	if {$queued} { 
		port_write_queued $outport msgout
	} else {
		port_write $outport msgout
	}
	unset msgout
    return
}

proc send_update {word meaning outport {queued 1}} {

	array set msgout {}
	port_factory_msg $outport msgout
	array set msgout "word $word cmd UPDATE meaning [list $meaning]"
	if {$queued} { 
		port_write_queued $outport msgout
	} else {
		port_write $outport msgout
	}
	unset msgout
    return
}

proc send_save {outport} {

	array set msgout {}
	port_factory_msg $outport msgout
	array set msgout "cmd SAVE"
	port_write_queued $outport msgout
	unset msgout
    return
}

proc send_populate_request {words outport {queued 1}} {
    global g_crawler_populate

	array set msgout {}
	port_factory_msg $outport msgout
	array set msgout "words [list $words] crawler $g_crawler_populate"
	if {$queued} { 
		port_write_queued $outport msgout
	} else {
		port_write $outport msgout
	}
	unset msgout
    return
}

proc send_define_request {word meaning outport {queued 1}} {
    global g_crawler_stub

	array set msgout {}
	port_factory_msg $outport msgout
	array set msgout "words $word symbol $word meanings [list $meaning] crawler $g_crawler_stub"
	if {$queued} { 
		port_write_queued $outport msgout
	} else {
		port_write $outport msgout
	}
	unset msgout
    return
}

proc send_map_request {word derived outport {queued 1}} {
    global g_crawler_stub

	array set msgout {}
	port_factory_msg $outport msgout
	array set msgout "words $derived symbol $derived root $word crawler $g_crawler_stub"
	if {$queued} { 
		port_write_queued $outport msgout
	} else {
		port_write $outport msgout
	}
	unset msgout
    return
}

proc send_delete_request {word derived outport} {

	if {$word != "" || $derived != ""} {
		array set msgout {}
		port_factory_msg $outport msgout
		array set msgout "cmd DELETE word $word derived $derived meanings {}"
		port_write_queued $outport msgout
		unset msgout
	}
	return
}

# Begin: procedures to handle the manual setting of meanings and derived words.

proc set_update_words {filename} {
    global g_update_words

    set g_update_words ""
    set fd [open $filename r]
    while {[gets $fd line] > -1} {
	lappend g_update_words $line
    }
    close $fd 
    return
}

proc set_update_word {root derived} {
    global g_update_words

    set g_update_words ""
    lappend g_update_words "$root $derived" 
    return
}

proc set_state {state} {
    global g_state

    set g_state $state
    return
}

proc get_state {} {
    global g_state

    return $g_state
}

proc get_root {} {
    global g_update_words

    set pair [lindex $g_update_words 0]
    set root [lindex $pair 0]

    return $root
}

proc get_derived {} {
    global g_update_words

    set pair [lindex $g_update_words 0]
    set derived [lindex $pair 1]

    return $derived
}

proc trim_update_words {} {
    global g_update_words

    set g_update_words [lrange $g_update_words 1 end]
    return [llength $g_update_words]
}

# End: procedures to handle the manual setting of meanings and derived words.

proc process {inport p_tmpdata} {
    global g_count
    global g_count_max
	upvar $p_tmpdata tmpdata

    set rc ""
    if {$inport == "IN-1"} {
    	array set tmpdata [byList::get_list $p_ip]
	set command $tmpdata(command)
	if {$command == "READ"} {
    	    set meanings $tmpdata(meanings)
	   
	    switch -- [get_state] \
	      NULL {  
                .f3.list delete 0 end
                foreach mean $meanings {
    	    	    .f3.list insert end $mean
    	        }

	    } FSM_CHECK_ROOT {
		set root [get_root]
		set derived [get_derived]
		if {$meanings == ""} {
		    send_populate_request $root "OUT-2" 0
		    set_state FSM_CHECK_SET
    		    .f3.list insert end "[get_state] set root: $root" 
		} else {
		    send_map_request $root $derived "OUT-2" 0
		    set_state FSM_CHECK_MAP
    		    .f3.list insert end "[get_state] set mapping: $root $derived" 
		}
	
	    } FSM_GET_ROOT {
		set root [get_root]
		set derived [get_derived]
		if {$meanings == ""} {
		    incr g_count -1
		    if {$g_count > 0} {
    		        .f3.list insert end "[get_state] wait for $root meaning set" 
		    	after 1000 
	    	    	send_request $root "OUT-1" 0
		    } else {

	    		if {[trim_update_words]} {
			    set root [get_root]
			    send_request $root "OUT-1" 0
			    set_state FSM_CHECK_ROOT
    			    .f3.list delete 0 end
    			    .f3.list insert end "[get_state] check root: $root" 
	    		} else {
    		            .f3.list insert end "FINISH" 
	    		    set_state NULL
	    		}

		    }
		} else {
		    after 1000 
		    send_map_request $root $derived "OUT-2" 0
		    set_state FSM_CHECK_MAP
    		    .f3.list insert end "[get_state] set mapping: $root $derived" 
		}

	    } default {

	    }

	}
    } elseif {$inport == "IN-2"} {
	switch -- [get_state] \
	   NULL {  

	} FSM_CHECK_SET {
	    set root [get_root]
	    send_request $root "OUT-1" 0
	    set_state FSM_GET_ROOT
	    set g_count $g_count_max

	} FSM_CHECK_MAP {
	    if {[trim_update_words]} {
		set root [get_root]
		send_request $root "OUT-1" 0
		set_state FSM_CHECK_ROOT
    		.f3.list delete 0 end
    	        .f3.list insert end "[get_state] check root: $root" 
 	
	    } else {
	    	set_state NULL
    		.f3.list insert end "FINISH" 

	    }

	} default {

	}

    } else {

    }
    return $rc
}

proc process {} {

	port_write_dequeued

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

    global g_crawler_populate
    global g_crawler_stub
    global g_state
    global g_update_words
    global g_count
    global g_count_max
 
    set g_crawler_populate [lindex $argdata(DATA) 0]
    set g_crawler_stub [lindex $argdata(DATA) 1]
    set g_state NULL 
    set g_update_words ""
    set g_count 0
    set g_count_max 10
    return
}

proc shutdown {} {
}
