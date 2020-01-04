set idx 1
set pattern "tclsh agent.tcl"
if {$tcl_platform(os) != "Darwin"} {
	set idx 3
	set pattern "tclsh"
}

set fd [open [lindex $argv 0] r]
while {[gets $fd line] > -1} {
	if {[string first $pattern $line] == -1} {
		continue
	}
	set proc_id [lindex $line $idx]
	catch {exec kill -9 $proc_id}
}
close $fd
exit
