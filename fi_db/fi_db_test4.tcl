#!/bin/sh
# \
exec tclsh $0 $@
source $env(FI_DB_HOME)/fi_db.tcl
source $env(FI_DB_HOME)/util/assert.tcl
source $env(FI_DB_HOME)/util/index.tcl
source $env(FI_DB_HOME)/util/set.tcl
source $env(PATTERN_HOME)/malloc.tcl

malloc::init
Assert::Init
Fi_db::Load [lindex $argv 0]

# Get the data files containing regexp match patterns.
foreach infile [glob $env(FI_DB_HOME)/util/*.dat] {
    set fd [open $infile r]
    gets $fd indexlist
    close $fd

    if {$indexlist == ""} {
	continue
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
	foreach index [lunion [gen_index $indexlist $desc] [gen_index $indexlist $company]] { 
	    Fi_db::Add_Company_to_Index $company $indexgrp $index
	}
    }
}

Fi_db::Save [lindex $argv 0]
exit 0
