#!/bin/sh
# \
exec tclsh $0 $@
source $env(CONTENT_HOME)/content.tcl
source $env(CONTENT_HOME)/content_fsm.tcl
source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/assert.tcl

malloc::init
Assert::Init
Fsm::Init
Fsm::Load_Fsm content_fsm.dat
Fsm::Init_Fsm content_fsm

Content::Init

set depth 4 
set doctype "parser_default"
set filename [lindex $argv 0]
set fd [open $filename r]
set data [read $fd]
seek $fd 0

# Get title and author.
set exp {Title: (.*?)\n}
regexp $exp $data -> title
if {![info exists title]} {
    puts "cannot find title. Exiting..."
    exit -1
}

set exp {Author: (.*?)\n}
regexp $exp $data -> author 
if {![info exists author]} {
    puts "cannot find author. Exiting..."
    exit -1
}

Content::Add_Title_Author $title $author

array set tmpdata {}
set curline ""

while {[gets $fd line] > -1} {
    if {$line != ""} {
	append curline " $line"
	continue
    }

    if {$curline == ""} {
	continue
    }

    set line [string trim $curline]
    set curline ""

    set tmpdata(line) $line
    set tmpdata(depth) $depth
    set tmpdata(doctype) $doctype
    set tmpdata(title) $title
    Fsm::Run content_fsm tmpdata
}

if {$curline != ""} {
    set line [string trim $curline]
    set tmpdata(line) $line
    set tmpdata(depth) $depth
    set tmpdata(doctype) $doctype
    set tmpdata(title) $title
    Fsm::Run content_fsm tmpdata
}
close $fd

if {[Fsm::Is_In_Service content_fsm] == 1} {
    Content::Display_All_Token $title $depth
} else {
    puts "fsm error: [Fsm::Get_Error content_fsm]"
}

Content::Save xxx
malloc::save [lindex $argv 1]
exit 0
