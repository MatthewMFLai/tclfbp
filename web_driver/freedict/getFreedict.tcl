#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/geturl.tcl
source [pwd]/freedict_fsm.tcl
package require htmlparse

proc fsm_if {tag slash param text} {
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    #regsub -all "\n" $text "" text
    set tmpdata(tag) $tag
    set tmpdata(slash) $slash
    set tmpdata(param) $param
    set tmpdata(text) $text
    set rc [Fsm::Run freedict_fsm tmpdata]
    if {$rc < 0} {
	puts "rc = $rc"
	puts [Fsm::Get_Error freedict_fsm]
	exit -1
    }
}

proc fsm {tag slash param text} {
    global g_fd
    # A simple state machine to extract company 
    # description data from globeinvestor.com
    regsub -all "\n" $text "" text
    puts $g_fd "tag = $tag"
    puts $g_fd "slash = $slash"
    puts $g_fd "param = $param"
    puts $g_fd "text = $text"
    puts $g_fd ""
}

# sanity mode 0: get real url data, parse with default fsm.
# sanity mode 1: get real url data, parse with custom fsm.
# sanity mode 2: get  url data from file, parse with custom fsm.
set sanity_mode 1 
Url::init
 
if {$sanity_mode} {
    malloc::init
    Fsm::Init

    Fsm::Load_Fsm freedict_fsm.dat
    Fsm::Init_Fsm freedict_fsm
}


set infile [lindex $argv 0]
set sanity [lindex $argv 1]

if {$sanity_mode != 2} { 
    set in_fd [open $infile r]
    gets $in_fd url
    close $in_fd
    if {[catch {Url::get_no_retry $url} data]} {
	puts "No entry found for $url"
	exit -1
    }
    # Custom code...

} else {
    set fd [open raw.dat r]
    set data [read $fd]
    close $fd
    # Custom code...
}

if {$sanity_mode == 0} {
    set fd [open raw.dat w]
    puts $fd $data
    close $fd
}

if {$sanity_mode} {
    htmlparse::parse -cmd fsm_if $data
    array set tmparray {}
    freedict_fsm::Dump_Data tmparray
    if {$sanity != "test"} {
 	array set tmptable {}
	freedict_fsm::Dump_Data tmptable
	foreach idx [array names tmptable] {
	    puts "$idx $tmptable($idx)"
	}
    } else {
	if {[llength [array names tmparray]] == 0} {
	    exit -1
	} 
    }
	 
	
} else {
    set g_fd [open out.dat w]
    htmlparse::parse -cmd fsm $data
    close $g_fd
}
exit 0
