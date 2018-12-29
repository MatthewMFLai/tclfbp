#!/bin/sh
# \
exec tclsh $0 $@
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl

set filename [lindex $argv 0]
set fsm_name [lindex [split $filename "."] 0]
set fsm_name [lindex [split $fsm_name "/"] end]
malloc::init
Fsm::Init
Fsm::Load_Fsm $filename 
Fsm::Dot_Output $fsm_name 

exit 0
