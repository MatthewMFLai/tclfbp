#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/geturl.tcl
source [pwd]/freedict_fsm.tcl
source [pwd]/freedict.tcl
package require htmlparse

Url::init
malloc::init
Fsm::Init
Fsm::Load_Fsm freedict_fsm.dat
Fsm::Init_Fsm freedict_fsm
set template "http://dictionary.reference.com/browse/XXX?s=t"
freedict::init $template
set word [lindex $argv 0]
array set tmpdata {}
freedict::doit $word tmpdata
foreach idx [array names tmpdata] {
    puts "$idx $tmpdata($idx)"
}
exit 0
