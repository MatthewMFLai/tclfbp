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

set crawler "options"
loadeach $env(WEB_DRIVER) $crawler

set infile [lindex $argv 0]
set outfile [lindex $argv 1]
set fd [open $infile r]
set fd2 [open $outfile w]
while {[gets $fd url] > -1} {
    set call_options ""
    set put_options ""
    # Need to extract symbol name.
    set idx [string first "symbol=" $url]
    incr idx [string length "symbol="]
    set idx2 [string first "\*" $url $idx]
    incr idx2 -1
    set symbol [string range $url $idx $idx2]
    # Finish getting symbol.
    ${crawler}::doit $url call_options put_options
    foreach options $call_options {
    	set data [concat CALL $symbol $options]
	puts $data
    	puts $fd2 $data 
    }
    foreach options $put_options {
    	set data [concat PUT $symbol $options]
	puts $data
    	puts $fd2 $data 
    }
}
close $fd
close $fd2

exit 0
