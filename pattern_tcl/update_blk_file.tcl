#!/bin/sh 
# \
exec tclsh $0 $@

proc update_blk_file {subdir filepathstr suffix_blk prefix envar} {

    # subdir looks like /tmp/node/basic/sink
    # filepathstr looks like filepath
    # suffix_blk looks like blk
    # prefix looks like /basic/sink

    if {[catch {glob $subdir/*$suffix_blk} rc]} {
	return
    }
    foreach filename $rc {
	set fd [open $filename r]
	set fd2 [open $filename.new w]
	while {[gets $fd line] > -1} {
	    if {[string first $filepathstr $line] == -1} {
		puts $fd2 $line
	    } else {
		puts $fd2 "$filepathstr \$env($envar)$prefix"  
	    }
	}
	close $fd
	close $fd2
	file delete $filename
	file rename $filename.new $filename
    }
    return
}

set subdir [lindex $argv 0]
set filepathstr [lindex $argv 1]
set suffix_blk [lindex $argv 2]
set prefix [lindex $argv 3]
set envar [lindex $argv 4]
update_blk_file $subdir $filepathstr $suffix_blk $prefix $envar
exit 0
