set fd [open [lindex $argv 0] r]
while {[gets $fd line] > -1} {
	if {[string first "tclsh agent.tcl" $line] == -1} {
		continue
	}
	set proc_id [lindex $line 1]
	exec kill -9 $proc_id
}
close $fd
exit
