#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(PATTERN_HOME)/geturl.tcl
source $env(WEB_DRIVER_HOME)/gutenberg/gutenberg.tcl

Url::init

set title [lindex $argv 0]
set templatefile [lindex $argv 1]
set outfile [lindex $argv 2]

set url_templates ""
set regexps ""

set fd [open $templatefile "r"]
gets $fd line
lappend url_templates $line
gets $fd line
lappend url_templates $line
gets $fd line
lappend regexps $line
gets $fd line
lappend regexps $line
gets $fd line
lappend regexps $line
close $fd

gutenberg::init $url_templates $regexps
array set tmpdata {}
gutenberg::extract_data $title tmpdata

if {[info exists tmpdata(content)]} {
    set fd [open $outfile "w"]
    puts $fd $tmpdata(content)
    close $fd
}
exit 0
