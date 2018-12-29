#!/bin/sh
# \
exec tclsh $0 $@
source $env(FI_DB_HOME)/fi_db.tcl
source $env(FI_DB_HOME)/fi_db_test_imp.tcl
source $env(FI_DB_HOME)/util/assert.tcl
source $env(FI_DB_HOME)/parse_financials.tcl
source $env(PATTERN_HOME)/malloc.tcl

# Each company data has the following layout. 
# All the non "f_*" is considered a metric.
# Wee need to scan one company to create all the 
# metric objects first.
#
#Revenue: 773
#f_Sector Financial Services
#f_Info A & W REVENUE ROYALTIES INCOME FUND, through its subsidiary, A&W TradeMarks Inc., licences trade-marks to others for royalty income.
#f_Symbol AW.UN
#f_Name A&W Revenue Royalties
#Profit: 377
#Asset_Rank 800
#Assets $74819000
#Cash Flow $8745000
#Sales $11982000
#Liabilities-to-Equity Ratio 0.01
#Price to Book 2.11
#Current Ratio n/a
#Liabilities $911000
#Price to Cash Flow 17.88
#Return on Equity 15.97%
#Price to Sales 13.05
#Earnings $11982000
#Cash $893000
#---------------

malloc::init
Assert::Init
Fi_db::Init

Financial_Parser::Init

set lines ""
set fd [open [lindex $argv 0] r]
while {[gets $fd line] > -1} {
    if {[string first "------" $line] == -1} {
	lappend lines $line
	continue
    }
    lappend lines $line
    create_financials_metrics $lines
    break	
}
close $fd

set lines ""
set fd [open [lindex $argv 0] r]
while {[gets $fd line] > -1} {
    if {[string first "------" $line] == -1} {
	lappend lines $line
	continue
    }
    lappend lines $line
    handle_financials $lines
    set lines ""
}
close $fd
Fi_db::Save [lindex $argv 1]
exit 0
