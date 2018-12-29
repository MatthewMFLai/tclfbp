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

set crawler "optionlist"
loadeach $env(WEB_DRIVER) $crawler

set fd [open [lindex $argv 0] r]
gets $fd url
close $fd

set fd [open [lindex $argv 1] w]
set optionlist ""
${crawler}::doit $url optionlist 
foreach line $optionlist {
    puts $line
    puts $fd $line
}
close $fd
exit 0
