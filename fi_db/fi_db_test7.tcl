#!/bin/sh
# \
exec tclsh $0 $@
source $env(FI_DB_HOME)/fi_db.tcl
source $env(FI_DB_HOME)/fi_db_test_imp.tcl
source $env(PATTERN_HOME)/assert.tcl
source $env(PATTERN_HOME)/time_util.tcl
source $env(PATTERN_HOME)/malloc.tcl

malloc::init
Assert::Init
Fi_db::Load [lindex $argv 0]

set fd [open [lindex $argv 1] r]
set exchange [lindex $argv 2]

while {[gets $fd line] > -1} {
    handle_option $line
}

Fi_db::Save [lindex $argv 0]
exit 0
