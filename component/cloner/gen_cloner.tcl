#!/bin/sh
# \
exec tclsh $0 $@

# Usage: tclsh gen_cloner.tcl <zzz_name> <zzz_path> <zzz_msgdef_path_name> <zzz_max_outport>
# eg. tclsh gen_cloner.tcl cloner /tmp/test /home/ubuntu/tclfbp/component/msgdef/test/test0.msg 3

set zzz_name [lindex $argv 0]
set zzz_path [lindex $argv 1]
set zzz_msgdef_path_name [lindex $argv 2]
set zzz_max_outport [lindex $argv 3]

# Create target folder
file mkdir $zzz_path
file copy all.tcl $zzz_path

# Create target <zzz_name>.tcl
set fd [open cloner.tcl r]
set cloner_body [read $fd]
close $fd

regsub -all "ZZZ_NUM_OUTPORT" $cloner_body $zzz_max_outport cloner_body
set fd [open $zzz_path/$zzz_name.tcl w]
puts $fd $cloner_body
close $fd

# Create target <zzz_name>.blk
set fd [open cloner.blk r]
set cloner_blk [read $fd]
close $fd

regsub -all "ZZZ_NAME" $cloner_blk $zzz_name cloner_blk
regsub -all "ZZZ_PATH" $cloner_blk $zzz_path cloner_blk
regsub -all "ZZZ_MSGDEF_PATH_NAME" $cloner_blk $zzz_msgdef_path_name cloner_blk
set fd [open $zzz_path/$zzz_name.blk w]
puts -nonewline $fd $cloner_blk

# Construct the outport line with multiple outports
set line "outports "
for {set i 1} {$i <= $zzz_max_outport} {incr i} {
	append line "\{$i $zzz_msgdef_path_name\} "
}
puts $fd $line
close $fd
