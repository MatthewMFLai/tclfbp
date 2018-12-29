#!/bin/sh
# \
exec tclsh $0 $@

set templatedir [lindex $argv 0]
set appname [lindex $argv 1]
set APPNAME [string toupper $appname]
set Appname [string toupper $appname 0 0]

file copy $templatedir $appname
set filelist [glob $appname/*]
foreach filename $filelist {
    if {[file isdirectory $filename]} {
	continue
    }
    set fd [open $filename r]
    set content [read $fd]
    close $fd
    file delete $filename
    regsub -all "appname" $content $appname content
    regsub -all "Appname" $content $Appname content
    regsub -all "APPNAME" $content $APPNAME content
    regsub -all "appname" $filename $appname filename
    set fd [open $filename w]
    puts -nonewline $fd $content 
    close $fd
}

exit 0

