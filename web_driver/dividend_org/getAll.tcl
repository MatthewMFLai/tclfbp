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

set crawler "dividend"
loadeach $env(WEB_DRIVER) $crawler

# Extract url template.
set fd [open [lindex $argv 2] r]
gets $fd url_template
close $fd

# Set up symbol suffix mapper.
set fd [open [lindex $argv 3] r]
while {[gets $fd line] > -1} {
    set mapper([lindex $line 0]) [lrange $line 1 end]
}
close $fd

${crawler}::init $url_template mapper

set infile [lindex $argv 0]
set outfile [lindex $argv 1]
set fd [open $infile r]
set fd2 [open $outfile w]
while {[gets $fd line] > -1} {
    if {[lindex $line 2] == "N/A"} {
	continue	
    }

    set cur_symbol [lindex $line 0]
    set rc [${crawler}::extract_data $cur_symbol]
    set urlerror [lindex $rc end]
    if {$urlerror == ""} {
	set symbol [lindex $rc 0]
    	set yield [lindex $rc 1] 
    	set yield5yr [lindex $rc 2] 
    	set paidsince [lindex $rc 3] 
	puts "$symbol $yield $yield5yr $paidsince"
	puts $fd2 "$symbol $yield $yield5yr $paidsince"
	flush $fd2
    } else {
   	puts $urlerror 
    }
}
close $fd
close $fd2
exit 0
