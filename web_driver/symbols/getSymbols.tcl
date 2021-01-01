#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/geturl.tcl
source $env(PWD)/symbols_fsm.tcl

set sanity_mode 1 
Url::init

if {$sanity_mode} {
    malloc::init
    Fsm::Init

    Fsm::Load_Fsm symbols_fsm.dat
    Fsm::Init_Fsm symbols_fsm
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
    Fsm::Run symbols_fsm argdata
    array set tmpdata {}
    symbols_fsm::Dump_Symbols tmpdata
    if {$sanity != "test"} {
    	foreach idx [lsort [array names tmpdata]] {
	    puts "$idx $tmpdata($idx)"
    	}
    } else {
	if {[llength [array names tmpdata]] == 0} {
	    exit -1
	}
    }
} else {
    set g_fd [open out.dat w]
    htmlparse::parse -cmd fsm $data
    close $g_fd
}
#Fsm::Dump
exit 0
