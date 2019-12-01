#!/bin/sh
# \
exec tclsh $0 $@

# usage:
# clean_ipc.tcl <ipcs capture file> 
# eg. clean_ipc.tcl ipc.dat 

if {$tcl_platform(os) == "Darwin"} {
	set shmstr "Shared Memory:"
} else {
	set shmstr "Shared Memory"
}

set fd [open [lindex $argv 0] r]
while {[gets $fd line] > -1} {
	if {[string first $shmstr $line] >= 0} {
		break
	}
}
while {[gets $fd line] > -1} {
	if {$line == ""} {
		break
	}
	set id [lindex $line 1]
	if {[string is integer $id]} {
		exec ipcrm -m $id
	}
}
close $fd
exit

