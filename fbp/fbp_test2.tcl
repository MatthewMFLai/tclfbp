#!/bin/sh
# \
exec tclsh $0 $@

source $env(FBP_HOME)/fbp.tcl
source $env(PATTERN_HOME)/assert.tcl
source $env(PATTERN_HOME)/malloc.tcl

set datafile [lindex $argv 0]
FlowGraph::Load_Graph $datafile 
FlowGraph::Dump

exit 0
