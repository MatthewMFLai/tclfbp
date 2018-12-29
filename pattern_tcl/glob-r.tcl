proc runit {dirname} {
    global tcl_platform

    set rc ""
    if {[string first "Windows" $tcl_platform(os)] != -1} {
    	set filelist [concat [glob -nocomplain $dirname/*] [glob -nocomplain -types hidden $dirname/*]]
    } else {
    	set filelist [glob -nocomplain $dirname/*]
    }
    foreach filename $filelist {
	if {[file isdirectory $filename] &&
	    [string first "cache" $filename] == -1} {
	    set rc [concat $rc [runit $filename]]
	} else {
	    lappend rc $filename
	}
    }
    return $rc
}

proc deleteCVS {dirname} {
    set dirlist ""
    foreach filename [runit $dirname] {
	set idx [string first "CVS" $filename]
	if {$idx == -1} {
	    continue
	}
	incr idx 2
	set dirname [string range $filename 0 $idx]
	if {[lsearch $dirlist $dirname] == -1} {
	    lappend dirlist $dirname
	}
    }
    foreach dir $dirlist {
	file delete -force $dir
    }
    return
}

proc change_CVS_root {dirname} {
    foreach filename [runit $dirname] {
	set idx [string first "Root" $filename]
	if {$idx == -1} {
	    continue
	}
	set fd [open $filename w]
	puts -nonewline $fd "\$CVSROOT"
	close $fd
    }
    return
}

proc change_CVS_root_ip {dirname new_ip} {
    foreach filename [runit $dirname] {
	set idx [string first "Root" $filename]
	if {$idx == -1} {
	    continue
	}
	set fd [open $filename r]
	gets $fd line
	close $fd
	# line should look like
	# :ssh:lai@192.168.2.10:/home/lai/sandbox
	set idx [string first "@" $line]
	set idx2 [string first ":" $line $idx]
	set newline [string range $line 0 $idx]$new_ip[string range $line $idx2 end]
	set fd [open $filename w]
	puts -nonewline $fd $newline 
	close $fd
	puts "Changed $filename"
    }
    return
}

proc gen_bat_from_sh {dirname} {
    global env

    if {![file exists $dirname/windows] ||  
	![file isdirectory $dirname/windows]} {
	return
    }
    set suffix ".bat"
    foreach filename [glob $dirname/*.sh] {
	puts $filename
	set curname $filename
	set filename [lindex [split $filename "/"] end]
	set idx [string last "." $filename]
	incr idx -1
	set filename [string range $filename 0 $idx]
	set filename $dirname/windows/$filename$suffix

	set fd [open $curname r]
	set fd2 [open $filename w]
	while {[gets $fd line] > -1} {
	    if {[string first "rm " $line] > -1 ||
		[string first "mv " $line] > -1} {
	        regsub -all "rm " $line "erase " line]
    	        regsub -all "mv " $line "move " line
		regsub -all "/" $line "\\" line
    	    } else {
		set curline $line
		set line "tclsh "
		append line $curline
	    }

	    # Change all environment variable from $XYZ to %XYZ%
	    foreach envvar [array names env] {
		regsub -all {\$} $line "#" line
		regsub -all "#$envvar" $line "%$envvar%" line
		regsub -all "#" $line {$} line
	    }
	    puts $fd2 $line
	}
	close $fd
	close $fd2
    }
}
