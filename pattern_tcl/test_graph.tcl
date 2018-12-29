#!/bin/sh
# \
exec tclsh $0 $@

# Test driver for testing the graph pattern class.
source graph.tcl

set max_nodes 50000
for {set i 0} {$i < $max_nodes} {incr i} {
	array set node$i {}
	graph_init_vertex node$i
	array set link$i {}
	graph_init_edge link$i
}

# Just one target node.
array set target {}
graph_init_vertex target

for {set i 0} {$i < $max_nodes} {incr i} {
	graph_add_edge node$i target link$i
}

# Test retrieve each link in turn.
for {set i 0} {$i < $max_nodes} {incr i} {
	puts [graph_get_edge node$i target]
}

# Test removing each link in turn.
for {set i [expr $max_nodes - 1]} {$i >= 0} {incr i -1} {
	if {[graph_remove_edge node$i target link$i] == 0} {
		puts "link$i removed"
	}
}

# Test unsetting each node and link in turn.
for {set i 0} {$i < $max_nodes} {incr i} {
	unset node$i
	unset link$i
}

unset target

exit 0				


