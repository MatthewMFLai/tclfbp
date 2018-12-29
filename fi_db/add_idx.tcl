#!/bin/sh
# \
exec tclsh $0 $@
source $env(FI_DB_HOME)/fi_db.tcl
source $env(FI_DB_HOME)/util/assert.tcl
source $env(FI_DB_HOME)/util/index.tcl
source $env(PATTERN_HOME)/malloc.tcl

malloc::init
Assert::Init
Fi_db::Load [lindex $argv 0]
set infile [lindex $argv 1]
if {[file exists $infile] == 0} {
    puts "$infile does not exist!"
    exit -1
}

# Get the data files containing regexp match patterns.
    set fd [open $infile r]
    gets $fd indexlist
    close $fd

    if {$indexlist == ""} {
	exit 0	
    }

    # Create index group.
    set indexgrp [lindex [split $infile "/"] end]
    set indexgrp [lindex [split $indexgrp "."] 0]    
    Fi_db::Handle_IndexGrp $indexgrp
    puts "processing $indexgrp"
    foreach index $indexlist {
	Fi_db::Handle_Index $indexgrp $index
    }
   
    foreach token [Fi_db::Get_Company_All] {
	set company [lindex $token 0]
	puts "processing $company"
	set desc [lindex $token 1]
	foreach index [gen_index $indexlist $desc] {
	    Fi_db::Add_Company_to_Index $company $indexgrp $index
	}
    }

Fi_db::Save [lindex $argv 0]
exit 0
