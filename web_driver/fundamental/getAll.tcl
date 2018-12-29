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

set crawler "fundamental"
loadeach $env(WEB_DRIVER) $crawler

set infile [lindex $argv 0]
set outfile [lindex $argv 1]
set fd [open $infile r]
set fd2 [open $outfile w]
while {[gets $fd line] > -1} {
    foreach url $line {
	set result [${crawler}::extract_data $url]
	set urlerror [lindex $result end]
	if {$urlerror != ""} {
	    puts $urlerror
	    continue
	}
	set symbol [lindex $result 0]
	set pe [lindex $result 1]
	set yield [lindex $result 2]
	set marketcap [lindex $result 3]
	set change [lindex $result 4]
	set volume [lindex $result 5]
	puts "$symbol $pe $yield $marketcap $change $volume"
	puts $fd2 "$symbol $pe $yield $marketcap $change $volume"
	flush $fd2
    }
}
close $fd
close $fd2

# Generate filtered file.
set fd [open $outfile r]
set fd2 [open $outfile.filtered w]
while {[gets $fd line] > -1} {
    set pe [lindex $line 1]
    set yield [lindex $line 2]
    if {$pe == "N/A" || $yield == "N/A"} {
	continue
    }
    if {$yield <= 8.00} {
	continue
    }
    puts $fd2 $line
}
close $fd
close $fd2

exit 0
