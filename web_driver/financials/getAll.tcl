#!/bin/sh
# \
exec tclsh $0 "$@"
package require htmlparse
source $env(PATTERN_HOME)/malloc.tcl
malloc::init

source $env(WEB_DRIVER)/loadall/loaddir.tcl
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/geturl.tcl
source $env(WEB_DRIVER)/financials/symbol_filter.tcl
Url::init
Fsm::Init
set crawler "financials"
loadeach $env(WEB_DRIVER) $crawler

# Extract url template.
set fd [open [lindex $argv 2] r]
gets $fd url_template
close $fd

set infile [lindex $argv 0]
set outfile [lindex $argv 1]
set exchange [lindex $argv 3]
set is_recover [lindex $argv 4]

${crawler}::init $url_template

set fd [open $infile r]
if {$is_recover == "recover"} {
    set fd2 [open $outfile a]
} else {
    set fd2 [open $outfile w]
}
set symbol_err_list ""

while {[gets $fd line] > -1} {
    # Extract main symbol.
    foreach symbol $line {
	array set tmpdata {}
	set rc [${crawler}::doit [list $symbol $exchange] tmpdata]
        if {$rc == 0} {
	    unset tmpdata
	    continue
	}
    	if {$rc == -1} {
	    lappend symbol_err_list $symbol
	    continue
	}
    	if {[info exists tmpdata(ERROR)] == 0} {
    	    foreach idx [array names tmpdata] {
		puts "$idx $tmpdata($idx)"
		puts $fd2 "$idx $tmpdata($idx)"
	    }
	    puts "---------------"
	    puts $fd2 "---------------"
    	} else {
    	    puts $tmpdata(ERROR) 
	    puts $fd2 $tmpdata(ERROR) 
	    flush $fd2
    	}
	unset tmpdata
    }
}
close $fd
close $fd2

if {$symbol_err_list != ""} {
    set fd [open symbol_err_list_$exchange w]
    puts $fd $symbol_err_list
    close $fd
    puts "symbol errors in symbol_err_list_$exchange!"
}
exit 0
