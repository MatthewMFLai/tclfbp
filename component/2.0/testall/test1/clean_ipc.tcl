#!/bin/sh
# \
exec tclsh $0 $@

# usage:
# clean_ipc.tcl <ipcs capture file> 
# eg. clean_ipc.tcl ipc.dat 

set fd [open [lindex $argv 0] r]
while {[gets $fd line] > -1} {
	if {$line == "Shared Memory:"} {
		break
	}
}
while {[gets $fd line] > -1} {
	if {$line == ""} {
		break
	}
	set id [lindex $line 1]
	exec ipcrm -m $id
}
close $fd
exit

