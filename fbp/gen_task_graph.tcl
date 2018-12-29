#!/bin/sh
# \
exec tclsh $0 $@

proc doit {blockfile linkfile outfile} {
    set fd [open $blockfile r]
    set fd2 [open $outfile w]

    puts $fd2 "digraph G \{"
    puts $fd2 "graph \[rankdir=LR\];"
    puts $fd2 "node \[shape=record\];"

    array set task {}
    array set inport {}
    array set outport {}
    set blockname ""
    while {[gets $fd line] > -1} {
	if {[lindex $line 0] == "Block"} {
	    set blockname [lindex $line 1]
	    set taskname [lindex $line 2]
	    set taskname [lindex [split $taskname "/"] end]
	    set taskname [lindex [split $taskname "."] 0]
	    set task($blockname) $taskname
	} elseif {[lindex $line 0] == "InPort"} {
	    set inport($blockname) [lrange $line 1 end]
	} elseif {[lindex $line 0] == "OutPort"} {
	    set outport($blockname) [lrange $line 1 end]
	} elseif {[lindex $line 0] == "QueueLen"} {
	    continue 
	} else {
	    puts "not recognized: $line"
	}
    }     
    close $fd

    # Generate the node lines first.
    foreach blockname [array names task] {
    	set line "$blockname \[shape=record,label=\""
	if {[info exists inport($blockname)]} {
	    append line "\{\{";
	    foreach port $inport($blockname) {
		append line "<in$port> in$port|"
	    }
	    set line [string range $line 0 end-1]
	    append line "\}|";
	}
	append line "\($blockname\)$task($blockname)" 
	if {[info exists outport($blockname)]} {
	    append line "|\{";
	    foreach port $outport($blockname) {
		append line "<out$port> out$port|"
	    }
	    set line [string range $line 0 end-1]
	    append line "\}\}"
	} else {
	    append line "\}"
	}
	append line "\"\];"
	puts $fd2 $line
    }

    set fd [open $linkfile r]
    while {[gets $fd line] > -1} {
	set fromblock [lindex $line 0]
	set fromport [lindex $line 1]
	set toblock [lindex $line 2]
	set toport [lindex $line 3]
	set line "$fromblock\:out$fromport\:e -> $toblock\:in$toport\:w;"
	puts $fd2 $line
    }
    close $fd
 
    puts $fd2 "\}"
    close $fd2
}

doit [lindex $argv 0] [lindex $argv 1] [lindex $argv 2]

exit 0
