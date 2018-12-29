#!/bin/sh
# \
exec tclsh $0 "$@"
package require htmlparse
source $env(PATTERN_HOME)/malloc.tcl
malloc::init
source $env(WEB_DRIVER)/loadall/loaddir.tcl
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/geturl.tcl
Url::init
Fsm::Init
set crawler "table"
loadeach $env(WEB_DRIVER)  $crawler

set infile [lindex $argv 0]
set outfile [lindex $argv 1]
set filterfile [lindex $argv 2]

set linelist ""
if {$filterfile != ""} {
    set fd [open $filterfile r]
    while {[gets $fd line] > -1} {
	lappend linelist $line
    }
    close $fd
}
 
set fd [open $infile r]
set fd2 [open $outfile w]
gets $fd url
array set web_data {}
${crawler}::doit $url web_data
if {[info exists web_data(ERROR)]} {
    puts $web_data(ERROR)
    exit -1 
}
foreach idx [lsort -integer [array names web_data]] {
    set toskip 0
    foreach line $linelist {
	if {[string first $line $web_data($idx)] > -1} {
	    set toskip 1 
	}
    }
    if {$toskip} {
	continue	
    }
    puts $web_data($idx) 
    puts $fd2 $web_data($idx)
}

close $fd
close $fd2

exit 0
