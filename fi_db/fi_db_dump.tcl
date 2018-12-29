#!/bin/sh
# \
exec tclsh $0 $@
source $env(FI_DB_HOME)/fi_db.tcl
source $env(PATTERN_HOME)/assert.tcl
source $env(PATTERN_HOME)/time_util.tcl
source $env(PATTERN_HOME)/malloc.tcl

malloc::init
Assert::Init
Fi_db::Load [lindex $argv 0]
Fi_db::Dump_All [lindex $argv 1]
exit 0
