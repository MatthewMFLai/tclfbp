source $env(FI_DB_HOME)/safe.tcl
source $env(FI_DB_HOME)/filter/filter_gui.tcl
source $env(FI_DB_HOME)/filter/filter_gui_util.tcl
source $env(FI_DB_HOME)/filter/filter_gui_chart.tcl
source $env(FI_DB_HOME)/filter/filter_gui_server.tcl
source $env(PATTERN_HOME)/set.tcl

proc display_criteria {infile p_v_low p_v_high p_widgetlist} {
    upvar $p_v_low v_low
    upvar $p_v_high v_high
    upvar $p_widgetlist widgetlist

    set widgetlist ""
    set fix_lines [getit $infile v_low v_high]
    # Kludge: return if there are no numeric values for the criteria.
    if {[array names v_low] == ""} {
	return $fix_lines
    }
    # End Kludge.
    set count 1
    set line "pack "
    foreach idx [array names v_low] {
        if {[string is integer $v_low($idx)] == 0} {
    	    newscale .sc$count $idx v_low($idx) 0.00 50.00 ISFLOAT
	    append line ".sc$count "
	    lappend widgetlist .sc$count
	    incr count
    	    newscale .sc$count $idx v_high($idx) 0.00 50.00 ISFLOAT 
	    append line ".sc$count "
	    lappend widgetlist .sc$count
	    incr count
        } else {
    	    newscale .sc$count $idx v_low($idx) 0 9000000000
	    append line ".sc$count "
	    lappend widgetlist .sc$count
	    incr count
    	    newscale .sc$count $idx v_high($idx) 0 9000000000
	    append line ".sc$count "
	    lappend widgetlist .sc$count
	    incr count
        }
    }
    append line "-side top"
    eval $line
    return $fix_lines
}

proc display_update_xy {row column p_x p_y} {
    upvar $p_x x
    upvar $p_y y

    set colsize 160
    set rowsize 120
    set colgap 20
    set rowgap 20

    set x [expr $column * ($colsize + $colgap)]
    set y [expr $row * ($rowsize + $rowgap)]
    return
}

proc display_charts {win symbollist max_per_row} {
    set tmplist ""
    set row 0
    set column 0
    foreach symbol $symbollist {
	if {[Chart_db::Load_Img $symbol] != ""} {
	    continue
	}
	lappend tmplist $symbol
    }
    foreach symbol $tmplist {
	display_update_xy $row $column x y
	set imh [Chart_db::Get_Img $symbol]
	$win create image $x $y -anchor nw -image $imh -tag "chart $symbol" 
	incr column
	if {$column == $max_per_row} {
	    incr row
	    set column 0
	}
    }
}

proc delete_charts {win} {
    foreach id [$win find withtag "chart"] {
	$win delete $id
    }
}

init_usrif
set listen_port [lindex $argv 0]
if {$listen_port != ""} {
    set_usrif $listen_port
}
 
set w .fr1
toplevel $w
text $w.text -relief sunken -bd 2
pack $w.text -expand yes -fill both
frame $w.buttons
pack $w.buttons -side bottom -fill x -pady 2m
button $w.buttons.load -text Load -command {
    set file [tk_getOpenFile -initialdir [pwd]]
    if {$file != ""} {
	global slave_fi_db
	global env
	# Kludge: use the hardcoded fi_db interpreter
	# name from safe.tcl to delete the current slave
	# interpreter before loading in another data file.
	if {[interp exists fi_db]} {
	    interp delete fi_db
	    source $env(FI_DB_HOME)/safe.tcl
	} 
	$slave_fi_db eval [list Fi_db::Load $file]
    	$w.text delete 0.0 end
	$w.text insert end "$file loaded\n"
        # Delete current charts first.
    	delete_charts $w2.c
    	$w3.text delete 0.0 end
    }
}
button $w.buttons.loadCriteria -text LoadCriteria -command {
    set file [tk_getOpenFile -initialdir [pwd]]
    set idx [string last "/" $file]
    set dirname [string range $file 0 $idx]
    incr idx
    set tmpfile [string range $file $idx end]
    if {$tmpfile == "all"} {
        gen_all_gif_frames $dirname 
	return
    }

    if {$file != ""} {
	load_criteria $file $w2
    }
}
button $w.buttons.saveCriteria -text SaveCriteria -command {
    set file [tk_getSaveFile -initialdir [pwd]]
    genit $file $g_fix_lines v_low v_high
}
button $w.buttons.run -text Run -command {
    set symbollist [run_criteria $w2]
    gen_3dplot_data test3d.dat $symbollist
}
button $w.buttons.exit -text Exit -command "exit 0"
pack $w.buttons.load $w.buttons.loadCriteria $w.buttons.saveCriteria $w.buttons.run $w.buttons.exit -side left -expand 1

# Feature: closing price graph display for filtered companies.
set gifdirlist ""
lappend gifdirlist $env(DISK2)/biggraph/gif_T
lappend gifdirlist $env(DISK2)/biggraph/gif_V
Chart_db::Init $gifdirlist

global w2
set w2 .fr2
create_gif_frame $w2 "Candle glance" 

set w3 .fr3
toplevel $w3
text $w3.text -relief sunken -bd 2
pack $w3.text -expand yes -fill both
bind_chart $w2

set g_cursymbol ""
set g_curfile ""
array set v_low {}
array set v_high {}
set g_fix_lines ""
set g_widgetlist ""
