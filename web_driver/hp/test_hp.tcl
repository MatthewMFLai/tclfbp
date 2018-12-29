#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/geturl.tcl
source $env(WEB_DRIVER)/hp/hp_fsm.tcl
source $env(WEB_DRIVER)/hp/hp.tcl
package require htmlparse

Url::init
malloc::init
Fsm::Init

Fsm::Load_Fsm hp_fsm.dat
Fsm::Init_Fsm hp_fsm

set infile [lindex $argv 0]
set in_fd [open $infile r]
gets $in_fd url
close $in_fd

array set web_data {}
set rc [hp::extract_data $url web_data]
if {$rc != ""} {
    puts "rc = $rc"
}
foreach idx [array names web_data] {
    puts "$idx $web_data($idx)"
}
exit 0

