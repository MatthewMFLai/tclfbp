#!/bin/sh
# \
exec tclsh $0 "$@"

source /disk2/crawler/util/stock_if.tcl
Stock_If::Init
set data 0.00

set exchange [lindex $argv 0]
set fd [open fundamental_$exchange r]
set fd2 [open wt_$exchange w]
while {[gets $fd line] > -1} {
    set symbol [lindex $line 0]
    if {[string first ".WT" $symbol] == -1} {
	continue
    }
    regsub {\.} $symbol "-" symbol
    regsub {\.} $symbol "" symbol
    puts "Processing $symbol"
    if {$exchange == "T"} {
        Stock_If::Get_stock_data $symbol to data
    	puts $fd2 "CREATE STOCK $symbol to 50 0.00 $data"
    } else { 
        Stock_If::Get_stock_data $symbol v data
    	puts $fd2 "CREATE STOCK $symbol v 50 0.00 $data"
    }
}
close $fd
close $fd2
exit 0
