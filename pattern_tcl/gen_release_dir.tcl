#!/bin/sh 
# \
exec tclsh $0 $@

set dir [lindex $argv 0]
file mkdir $dir
exit 0
