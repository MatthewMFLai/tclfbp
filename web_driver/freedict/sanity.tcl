#!/bin/sh
# \
exec tclsh $0 "$@"
set runcmd [list exec $env(PWD)/getFreedict.tcl $env(PWD)/url.in test]
set status [catch $runcmd rc]
if {$status} {
    puts $errorCode
} else {
    puts "pass"
}
exit 0
