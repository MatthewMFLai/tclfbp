#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/geturl.tcl
source $env(PWD)/stock_fsm.tcl

set sanity_mode 0 
Url::init

if {$sanity_mode} {
    malloc::init
    Fsm::Init

    Fsm::Load_Fsm stock_fsm.dat
    Fsm::Init_Fsm stock_fsm
}

set infile [lindex $argv 0]
set sanity [lindex $argv 1]

set in_fd [open $infile r]
gets $in_fd url
close $in_fd

if {$sanity_mode != 2} {
    set data [Url::get_no_retry $url]
}
if {$sanity_mode == 0} {
    set fd [open raw.dat w]
    puts $fd $data
    close $fd
} elseif {$sanity_mode == 2} {
    set fd [open raw.dat r]
    set data [read $fd]
    close $fd
} else {

}

if {$sanity_mode} {
    set argdata(data) $data
    Fsm::Run stock_fsm argdata
    array set tmpdata {}
    stock_fsm::Dump_Stock tmpdata
    if {$sanity != "test"} {
    	foreach idx [lsort [array names tmpdata]] {
	    puts "$idx $tmpdata($idx)"
    	}
    } else {
	if {[llength [array names tmpdata]] == 0} {
	    exit -1
	}
    }
}
#Fsm::Dump
exit 0
