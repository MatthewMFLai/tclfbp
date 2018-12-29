#!/bin/sh 
# \
exec tclsh $0 $@

source $env(PATTERN_HOME)/sys_util.tcl
set rc [UtilSys::Is_Runtime]
puts "rc = $rc"
exit 0
