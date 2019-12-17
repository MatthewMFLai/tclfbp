#!/bin/sh
# \
exec tclsh $0 $@

# usage:
# fbp_postproc.tcl <input node file> <input link file> <output node file> <output link file>
# eg. fbp_postproc.tcl test.node test.link twopc.node twopc.link

set tx_path {$env(HOME)/tclfbp/component/2.0/sock_node/sock_node_tx.blk}
set rx_path {$env(HOME)/tclfbp/component/2.0/sock_node/sock_node_rx.blk}
set sock_node_prefix "SOCK_RTX_"
set rx_suffix "-RX"
set nodenum 1

set outnodes ""
set outlinks ""

# Read the node file first.
array set nodes {}
set fd [open [lindex $argv 0] r]
while {[gets $fd line] > -1} {
	set line [string trim $line]
	if {$line == ""} {
		continue
	}
	if {[string first "#" $line] == 0} {
		continue
	}

	# Line looks like
	# src1 $env(HOME)/tclfbp/component/2.0/source/source.blk ip1

	set nodename [lindex $line 0]
	set ip [lindex $line 2]

	lappend outnodes $line
	set nodes($nodename) $ip
}

# Read the link file next.
set fd [open [lindex $argv 1] r]
while {[gets $fd line] > -1} {
	set line [string trim $line]
	if {$line == ""} {
		continue
	}
	if {[string first "#" $line] == 0} {
		continue
	}

	# Line looks like
	# clo1 1 src1 1 4

	set fromname [lindex $line 0] 
	set fromport [lindex $line 1] 
	set toname [lindex $line 2] 
	set toport [lindex $line 3] 
	set fifo_len [lindex $line 4]

	if {$nodes($fromname) == $nodes($toname)} {
		lappend outlinks $line
		continue
	}

	# Change the line 
	# clo1 2 trc1 1 32
	# to
	# clo1 2 SOCK_RTX_1 1 16
	# SOCK_RTX_1-RX 1 trc1 1 16

	set fifo_len [expr $fifo_len / 2]
	if {$fifo_len == 0} {
		set fifo_len 1
	}
	
	lappend outlinks "$fromname $fromport $sock_node_prefix$nodenum 1 $fifo_len"	
	lappend outlinks "$sock_node_prefix$nodenum$rx_suffix 1 $toname $toport $fifo_len"

	# Add sock nodes to outnodes list.
	lappend outnodes "$sock_node_prefix$nodenum $tx_path $nodes($fromname)"
	lappend outnodes "$sock_node_prefix$nodenum$rx_suffix $rx_path $nodes($toname)"

	incr nodenum
}
close $fd

set fd [open [lindex $argv 2] w]
foreach node $outnodes {
	puts $fd $node
}
close $fd

set fd [open [lindex $argv 3] w]
foreach link $outlinks {
	puts $fd $link
}
close $fd

exit
