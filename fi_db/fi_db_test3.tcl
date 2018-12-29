#!/bin/sh
# \
exec tclsh $0 $@
source $env(FI_DB_HOME)/fi_db.tcl
source $env(FI_DB_HOME)/fi_db_test_imp.tcl
source $env(FI_DB_HOME)/util/assert.tcl
source $env(PATTERN_HOME)/malloc.tcl

# Dividendinvestor data looks like: symbol PE yield
#ATD__A 0.60% 0.80% 2005
#ABK__A 2.50% 2.90% 2005
#AGT 2.20% 5.10% 2009
#AP__U 5.50% 6.60% 2003

# Each company fundamental data has the following layout. 

malloc::init
Assert::Init
Fi_db::Load [lindex $argv 0]

set fd [open [lindex $argv 1] r]
while {[gets $fd line] > -1} {
    handle_dividend $line
}
close $fd
Fi_db::Save [lindex $argv 0]
exit 0
