#!/bin/sh
# \
exec tclsh $0 "$@"
package require htmlparse
source $env(PATTERN_HOME)/malloc.tcl
malloc::init
source $env(WEB_DRIVER)/loadall/loaddir.tcl
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/geturl.tcl
Url::init
Fsm::Init
set crawler "symbolpage"
loadeach $env(WEB_DRIVER) $crawler

set exchange [lindex $argv 0]
${crawler}::init

set fd [open symbollist_$exchange w]
set fd2 [open symbollink_$exchange w]
set grouplist {A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0}
set symbollist_list ""
set symbollink_list ""
foreach group $grouplist {
    set page 1
    set toloop 1
    while {$toloop} {
    	#puts "Extract group $group page $page for exchange $exchange"
    	set symbollist ""
    	set symbollink ""
    	set total_page [${crawler}::doit $group $page $exchange symbollist symbollink]
	if {$total_page == 0} {
	    break
	}
        puts $fd $symbollist
	puts $fd2 $symbollink
    	if {$total_page > $page} {
	    incr page
    	} else {
	    set toloop 0
    	}
    }
}
close $fd
close $fd2
#close $fd3
exit 0
