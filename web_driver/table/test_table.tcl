#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/geturl.tcl
source [pwd]/table_fsm.tcl
source [pwd]/custom/table_fsm_dividend.tcl
source [pwd]/table.tcl
package require htmlparse

Url::init
malloc::init
Fsm::Init
Fsm::Load_Fsm table_fsm.dat
Fsm::Init_Fsm table_fsm

set symbol [lindex $argv 0]
array set data {}
table::doit $symbol data
foreach idx [lsort [array names data]] {
    set tmptable $data($idx)
    table_fsm::Format_Table tmptable
}
exit 0
