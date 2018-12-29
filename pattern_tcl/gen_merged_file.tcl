#!/bin/sh
# \
exec tclsh $0 $@

set filelist [lrange $argv 0 end-1]
set outfile [lindex $argv end]
set fd [open $outfile w]

foreach filename $filelist {
    set fd2 [open $filename r]
    set data [read $fd2]
    close $fd2
    puts $fd $data
    puts $fd "" 
}
close $fd

exit 0
