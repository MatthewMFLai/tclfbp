#!/bin/sh
# \
exec tclsh $0 "$@"
set runcmd [list exec $env(PWD)/getOptionlist.tcl $env(PWD)/url.in test]
set status [catch $runcmd rc]
if {$status} {
    puts $errorCode
} else {
    puts "Optionlist pass"
}
exit 0
