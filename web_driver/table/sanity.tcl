#!/bin/sh
# \
exec tclsh $0 "$@"
set runcmd [list exec $env(PWD)/getTable.tcl $env(PWD)/derivative/url.in test]
set status [catch $runcmd rc]
if {$status} {
    puts $errorCode
} else {
    puts "Warrant pass"
}

set runcmd [list exec $env(PWD)/getTable.tcl $env(PWD)/derivative/url_debenture.in test]
set status [catch $runcmd rc]
if {$status} {
    puts $errorCode
} else {
    puts "Debenture pass"
}

set runcmd [list exec $env(PWD)/getTable.tcl url.in test]
set status [catch $runcmd rc]
if {$status} {
    puts $errorCode
} else {
    puts "Table pass"
}
exit 0
