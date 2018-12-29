proc doit {filename key value} {

    set fd [open $filename r]
    set fd2 [open $filename.mig w]
    while {[gets $fd line] > -1} {
	if {[string first "m_block" $line] == -1} {
	    puts $fd2 $line
	    continue
	}
	eval $line
	set idlist ""
	foreach idx [array names m_block] {
	    set systemid [lindex [split $idx ","] 0]
	    if {[lsearch $idlist $systemid] == -1} {
		lappend idlist $systemid
	    }
	}
	foreach id $idlist {
	    set m_block($id,$key) $value
	}
	set newline "array set m_block \"[array get m_block]\""
	regsub -all {\$} $newline "\\\$" newline
	puts $fd2 $newline
    }
    close $fd
    close $fd2

    file delete $filename
    file rename $filename.mig $filename
    return
}
