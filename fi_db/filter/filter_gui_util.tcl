proc getit {filename p_criteria_low p_criteria_high} {
    upvar $p_criteria_low criteria_low
    upvar $p_criteria_high criteria_high

    set fd [open $filename r]
    set fix_lines ""
    while {[gets $fd line] > -1} {
	set line [string trim $line]
	if {[string index $line 0] == "#"} {
	    continue
	}

	lappend fix_lines $line

	set category [lindex $line 0]
	if {$category != "Metric" &&
            $category != "Yield"} {
	    continue
	}
	if {$category == "Metric"} {
	    set idx [lindex $line 1]
	    set criteria_low($idx) [lindex $line 2]
	    set criteria_high($idx) [lindex $line 3]
	} else {
	    set idx $category 
	    set criteria_low($idx) [lindex $line 1]
	    set criteria_high($idx) [lindex $line 2]
	}
    }
    close $fd
    return $fix_lines
}

proc genit {filename fix_lines p_criteria_low p_criteria_high} {
    upvar $p_criteria_low criteria_low
    upvar $p_criteria_high criteria_high

    set fd [open $filename w]
    foreach line $fix_lines {
	set category [lindex $line 0]
	if {$category != "Metric" &&
            $category != "Yield"} {
    	    puts $fd $line
	    continue
	}

	if {$category == "Metric"} {
	    set idx [lindex $line 1]
	    set lowidx 2
	    set highidx 3
	} else {
	    set idx $category
	    set lowidx 1 
	    set highidx 2 
	}
	set low $criteria_low($idx)
	set high $criteria_high($idx)
	set line [lreplace $line $lowidx $lowidx $low]
	set line [lreplace $line $highidx $highidx $high]
    	puts $fd $line
    }
    close $fd
    return
}

proc init_grp_symbol {filename} {
    set fd [open $filename w]
    puts $fd "Symbols \{\}"
    close $fd
    return 
}

proc update_grp_symbol {filename symbol action} {
    set newline  ""
    set updatefile 0
    set fd [open $filename r]
    while {[gets $fd rawline] > -1} {
	set line [string trim $rawline]
	if {[string first "#" $line] == 0} {
	    append newline "$rawline\n"
	    continue
	}
	set idx [lindex $line 0]
	if {$idx != "Symbols"} {
	    append newline "$rawline\n"
	    continue
	}
	set symbollist [lindex $line 1]
	set symbol [string toupper $symbol]
	switch -- $action {
	    ADD {
		if {[lsearch $symbollist $symbol] == -1} {
		    lappend symbollist $symbol
		}
		set updatefile 1	
	    } REMOVE {
		set idx [lsearch $symbollist $symbol]
		if {$idx != -1} {
		    set symbollist [lreplace $symbollist $idx $idx] 
		}
		set updatefile 1	
	    } default {
		# No action.
	    }
	}
	append newline "Symbols [list $symbollist]\n"
    }
    close $fd

    if {$updatefile == 0} {
	return
    }

    set fd [open $filename w]
    puts -nonewline $fd $newline
    close $fd
    return 
}

proc getgroupdata {filename} {
    # The group file looks like this:
    # Symbols {JE AGF.B .... }
    set fd [open $filename r]
    gets $fd line
    close $fd
    regsub "{" $line "" line    
    regsub "}" $line "" line
    return [lrange $line 1 end]
}

proc gen_3dplot_data {filename symbollist} {
    global slave_fi_db
    # Test code. Generate a file containing market cap, liability to equity,
    # and price to book ratios for each symbol. The file is fed to gnuplot
    # for 3D scatter plot generation.
    set fd [open $filename w]
    foreach symbol $symbollist {
        array set tmptable {}
        foreach token [$slave_fi_db eval [list Fi_db::Dump_Company_Metric $symbol]] {
	    array set tmptable $token
	}
	set key "Liabilities-to-Equity Ratio"
	if {![info exists tmptable($key)]} {
	    unset tmptable
	    continue
	} else {
	    set ltoe $tmptable($key)
	} 
	set key "Price to Book"
	if {![info exists tmptable($key)]} {
	    unset tmptable
	    continue
	} else {
	    set ptob $tmptable($key)
	}
	set key "Market Cap"
	if {![info exists tmptable($key)]} {
	    unset tmptable
	    continue
	} else {
	    set marcap $tmptable($key)
	} 
	puts $fd "$ltoe $ptob $marcap $symbol"
	unset tmptable	
    }
    close $fd
    return
}

# Procedures to handle frame with stock quote gif files.
proc create_gif_frame {win title} {
    toplevel $win
    wm title $win $title
    frame $win.buttons
    pack $win.buttons -side bottom -fill x -pady 2m
    button $win.buttons.creategrp -text CreateGroup -command {
    	set file [tk_getSaveFile -initialdir [pwd]]
    	init_grp_symbol $file
    }
    button $win.buttons.selectgrp -text SelectGroup -command {
    	set g_curfile [tk_getOpenFile -initialdir [pwd]]
    }
    button $win.buttons.subtractgrp -text SubtractGroup -command {
    	# Find the currently displayed symbols from the image tags.
    	foreach i [$win.c find all] {
            foreach tagname [$win.c itemcget $i -tags] {
	    	if {$tagname != "chart"} {
	    	    lappend symbollist $tagname
	    	    break
	    	}
            }
    	}
        set tmpdir [tk_chooseDirectory -initialdir [pwd]]
    	foreach filename [glob $tmpdir/*] {
	    if {[file isdirectory $filename]} {
	    	continue
	    }
            set subtract_symbols [getgroupdata $filename]
    	    set symbollist [UtilSet::ldifference $symbollist $subtract_symbols]
    	}
    	delete_charts $win.c
    	display_charts $win.c [lsort -unique $symbollist] 4
    }
    button $win.buttons.addtogrp -text "+"  -command {
    	if {$g_cursymbol == "" ||
            $g_curfile == ""} {
	    tk_dialog .foo "Error" "Group not selected" "" 0 OK
	    return
    	}
    	update_grp_symbol $g_curfile $g_cursymbol "ADD"
    }
    button $win.buttons.rmfromgrp -text "-" -command {
    	if {$g_cursymbol == "" ||
            $g_curfile == ""} {
	    tk_dialog .foo "Error" "Group not selected" "" 0 OK
	    return
    	}
        update_grp_symbol $g_curfile $g_cursymbol "REMOVE"
    }
    if {![check_usrif]} {
    	pack $win.buttons.creategrp $win.buttons.selectgrp $win.buttons.subtractgrp \
      	    $win.buttons.addtogrp $win.buttons.rmfromgrp -side left -expand 1
    } else {
    	button $win.buttons.export -text "export"  -command {
    	    if {$g_cursymbol != ""} {
		server_send [server_get] $g_cursymbol
	        return
    	    }
    	}
    	set cmd {
	    set symbollist ""
	    foreach id [ZZZ.c find withtag "chart"] {
		foreach tagname [ZZZ.c itemcget $id -tag] {
	    	    if {$tagname != "chart"} {
	    		lappend symbollist $tagname
	    		break
	    	    }
	 	}
	    }
    	    if {$symbollist != ""} {
		server_send [server_get] $symbollist
	    	return
    	    }
    	}
	regsub -all "ZZZ" $cmd $win cmd
    	button $win.buttons.exportall -text "export all" -command $cmd

    	pack $win.buttons.creategrp $win.buttons.selectgrp $win.buttons.subtractgrp \
      	    $win.buttons.addtogrp $win.buttons.rmfromgrp \
            $win.buttons.export $win.buttons.exportall -side left -expand 1
   }
    set c_var [canvas $win.c -bg khaki \
             -xscrollcommand "$win.xbar set" \
	     -yscrollcommand "$win.ybar set"]
    scrollbar $win.xbar -ori hori -command "$win.c xview"
    scrollbar $win.ybar -ori vert -command "$win.c yview"
    pack $win.ybar -side right -fill y
    pack $win.xbar -side bottom -fill both
    pack $win.c -side left -fill both -expand 1

    return
}

proc load_criteria {filename win} {
    global g_widgetlist
    global g_fix_lines
    global w
    global w3

    foreach token $g_widgetlist {
    	destroy $token
    }
    foreach idx [array names v_low] {
    	unset v_low($idx)
    }
    foreach idx [array names v_high] {
    	unset v_high($idx)
    }
    set g_fix_lines [display_criteria $filename v_low v_high g_widgetlist]
    $w.text delete 0.0 end
    $w.text insert end "Criteria $filename loaded\n"
    if {$win != ""} {
    	delete_charts $win.c
    }
    $w3.text delete 0.0 end
    return
}

proc run_criteria {win} {
    global slave_fi_db
    global g_fix_lines
    global w

    set file test.out 
    genit $file $g_fix_lines v_low v_high

    set symbollist ""
    set tmplist [$slave_fi_db eval [list run_filter $file]]
    if {$tmplist == ""} {
	return
    }
    set companylist [$slave_fi_db eval \
        [list Fi_db::Order_By_Metric $tmplist "Market Cap"]]
    set tmplist ""
    foreach company $companylist {
	set symbol [$slave_fi_db eval [list Fi_db::Get_Company_Symbol $company]]
	lappend symbollist $symbol
	lappend tmplist "$company ($symbol)"
    }
    $w.text insert end "$tmplist\n"

    display_charts $win.c $symbollist 4
    $win.c configure -scrollregion [$win.c bbox all] \
        -xscrollincrement 0.1i -yscrollincrement 0.1i

    return $symbollist
}

proc bind_chart {win} {
    $win.c bind chart <B1-ButtonRelease> {
    	set symbol ""
    	foreach tagname [%W itemcget current -tags] {
	    if {$tagname != "chart"} {
	    	set symbol $tagname
	    	break
	    }
    	}
    	if {$symbol == ""} {
	    return
    	}
    	set rc [$slave_fi_db eval [list Fi_db::Dump_Company_Metric $symbol]]
    	$w3.text delete 0.0 end
    	set name [$slave_fi_db eval [list Fi_db::Find_Company $symbol]]
    	$w3.text insert end "$name\n"
    	set desc [$slave_fi_db eval [list Fi_db::Get_Company_Desc $name]]
    	$w3.text insert end "$desc\n"
    	foreach tuple $rc {
            $w3.text insert end "[lindex $tuple 0] [lindex $tuple 1]\n"
    	}
    	set g_cursymbol $symbol
    }
    return
}

proc gen_all_gif_frames {dirname} {
    global g_widgetlist
    global w
    global w3
    global g_cursymbol
    global g_fix_lines

    foreach filename [glob -directory $dirname *] {
	if {[file isdirectory $filename]} {
	    continue
	}
	if {[string last "/all" $filename] > -1} {
	    continue
	}
	set idx [string last "/" $filename]
	incr idx
	load_criteria $filename ""
	set windowname [string range $filename $idx end]
        set win .$windowname
	create_gif_frame $win $windowname
	run_criteria $win
	bind_chart $win
    }
    return
}

