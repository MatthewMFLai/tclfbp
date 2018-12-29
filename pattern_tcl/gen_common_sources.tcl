#!/bin/sh
# \
exec tclsh $0 $@

set crawlerlist [lrange $argv 0 end-1]
set outfile [lindex $argv end]
set fd [open $outfile w]

foreach crawler $crawlerlist {
    puts $fd "source \$env(WEB_DRIVER)/$crawler/$crawler.tcl"

    set filelist ""
    catch {glob $env(WEB_DRIVER)/$crawler/*} filelist
    foreach filename $filelist {
	if {[file isdir $filename]} {
	    continue
	}
	if {[string first "_fsm.tcl" $filename] > 0} {
	    # Only keep the name portion.
	    set idx [string last "/" $filename]
	    incr idx
	    set filename [string range $filename $idx end]
    	    puts $fd "source \$env(WEB_DRIVER)/$crawler/$filename"
	} 
    }

    if {$crawler == "financials"} {
        puts $fd "source \$env(WEB_DRIVER)/$crawler/symbol_filter.tcl"
    }	
    puts $fd "source \$env(COMP_HOME)/stock/$crawler/$crawler.tcl"
    puts $fd ""
}
close $fd

exit 0
