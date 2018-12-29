#!/bin/sh
# \
exec tclsh $0 $@
source $env(FI_DB_HOME)/fi_db.tcl
source $env(FI_DB_HOME)/fi_db_test_imp.tcl
source $env(FI_DB_HOME)/util/assert.tcl
source $env(PATTERN_HOME)/malloc.tcl

# Fundamental data looks like: symbol PE yield
#AKL 2.10 N/A
#AKT.A 16.70 2.395
#AKT.B N/A 2.393
#ASR N/A N/A
#ASR.DB N/A N/A

# Each company fundamental data has the following layout. 

malloc::init
Assert::Init
Fi_db::Load [lindex $argv 0]

# Create the metric objects for PE and yield first.
Fi_db::Handle_Metric "PE"
Fi_db::Handle_Metric "Market Cap"
Fi_db::Handle_Metric "Price Change"
Fi_db::Handle_Metric "Volume"

set fd [open [lindex $argv 1] r]
while {[gets $fd line] > -1} {
    handle_fundamental $line
}
close $fd
Fi_db::Save [lindex $argv 0]
exit 0
