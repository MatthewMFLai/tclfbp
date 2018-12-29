#!/bin/sh
# \
exec tclsh $0 $@
source $env(CONTENT_HOME)/content.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/assert.tcl

malloc::init
Assert::Init

set depth 4 
set filename /tmp/dummy.dat 

if {[file exists $filename]} {
    malloc::restore $filename
    Content::Load $filename
}

if {0} {
set title "Study In Scarlet"
set data [Content::Get_Concordance $title $depth]
puts "Number of words: [llength $data]"
set title "Tales of Horror and Mystery"
set data [Content::Get_Concordance $title $depth]
puts "Number of words: [llength $data]"
}

#exit 0
