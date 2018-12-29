#!/bin/sh 
# \
exec tclsh $0 $@

set infile [lindex $argv 0]
set outfile [lindex $argv 1]
set fd [open $infile r]
set data [read $fd]
close $fd

if {$data == ""} {
    exit 0
}

array set sourceloaded {}
set is_dynamic_source 0
set filelist ""

set data [split $data "\n"]
set fd [open $outfile w]
set toloop 1
while {$toloop} {
    global env
    set line [lindex $data 0]
    set data [lrange $data 1 end]
    set tmpline [string trim $line]

    # The dynamic source expension logic below is custom code to 
    # handle sourcing in the SCADS generated tcl modules.
    # If the tcl module contains these lines
    # # DYNAMIC SOURCE BEGIN
    # foreach filename [glob $env(...)...*.tcl] {
    #     source $filename
    # }
    # # DYNAMIC SOURCE END
    # 
    # the glob command will be evaluated and the list of filenames
    # will be read in subsequently.
    #
    if {$is_dynamic_source} {
	if {[string first "DYNAMIC SOURCE END" $tmpline] > -1} {
	    set is_dynamic_source 0

	    set cmdlist ""		
	    foreach filename $filelist {
		lappend cmdlist "source $filename"
	    }
	    set filelist ""
	    if {$cmdlist != ""} {
	    	set data [concat $cmdlist $data]
	    }
	}
	if {[string first "glob " $tmpline] > -1} {
	    set idx [string first "glob " $tmpline]
	    set idx2 [string first "\]" $tmpline]
	    incr idx2 -1
	    set cmd [string range $tmpline $idx $idx2]
	    set filelist [eval $cmd]
	}
    	set toloop [llength $data]
	continue
    }
    if {[string first "DYNAMIC SOURCE BEGIN" $tmpline] > -1} {
	    set is_dynamic_source 1
    	    set toloop 1
	    continue
    }
 
    if {[string first "source " $tmpline] != 0} {
	if {[string first "BEGIN" $tmpline] == 0 ||
	    [string first "END" $tmpline] == 0} {
	    puts $fd "# $tmpline"
	} else {
	    puts $fd $line
	}
    } else {
	set idx [string first " " $tmpline]
	incr idx
	set sourcefile [string range $tmpline $idx end]
	set sourcefile [subst $sourcefile]
	
	if {[info exists sourceloaded($sourcefile)]} {
	    puts "$sourcefile already loaded"
    	    set toloop [llength $data]
	    continue 
	}
	set sourceloaded($sourcefile) 1
 
	set fd2 [open $sourcefile r]
	set tmpdata [read $fd2]
	set tmpdata [split $tmpdata "\n"]
	close $fd2
	
	set beginline [list [list BEGIN $sourcefile]]
	set endline [list [list END $sourcefile]]
	set data [concat $beginline $tmpdata $endline $data]
    }
    set toloop [llength $data]
}
close $fd

exit 0
