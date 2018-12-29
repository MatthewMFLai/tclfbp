#!/bin/sh
# \
exec tclsh $0 $@

set pattern_class_file [lindex $argv 0]
set pattern_varname [lindex $argv 1]

set pattern_class [lindex [split $pattern_class_file "/"] end]

set fd [open $pattern_class_file.tcl r]
set data [read $fd]
close $fd

regsub -all "&" $data "$pattern_class:$pattern_varname:" data

set fd [open $pattern_varname.tcl w]
puts $fd "namespace eval $pattern_varname \{"
puts $fd $data
puts $fd "\}"
close $fd

exit 0
