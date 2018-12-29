#!/bin/sh
# \
exec tclsh $0 $@

source $env(FBP_HOME)/fbp.tcl
source $env(PATTERN_HOME)/assert.tcl
source $env(PATTERN_HOME)/malloc.tcl

proc setport {line in_out p_subcircuit p_block hostipaddr} {
    # Get the list of ports.
    set portlist [lrange $line 1 end]
    foreach port $portlist {
    # If the port format is x:y, then y is the 
    # corresponding vport.
    	if {[string first ":" $port] > 0} {
	    set portnum [lindex [split $port ":"] 0]
	    set vportnum [lindex [split $port ":"] 1]
	} else {
	    set portnum $port
	    set vportnum ""
	}
	set p_port [FlowGraph::Create_Object $in_out\Port $portnum $hostipaddr]
	FlowGraph::Set_$in_out\Port $p_block $p_port
	if {$vportnum != ""} {
	    set p_vport [FlowGraph::Create_Object $in_out\Vport $vportnum $hostipaddr]
	    FlowGraph::Set_$in_out\Port $p_subcircuit $p_vport
	    FlowGraph::Set_Vport_Port_Link $p_vport $p_port
    	}
    }
}

proc setportqueue {line block_name} {
    # Get the list of ports.
    set port [lindex $line 1]
    set queuelen [lindex $line 2]
    FlowGraph::Set_Port_Queuelen $block_name $port $queuelen
    return
}

proc setipaddr {line p_block} {
    # Get the list of ports.
    set ipaddr [lindex $line 1]
    FlowGraph::Set_IPAddr $p_block $ipaddr
    return
}

proc settimeout {line p_block} {
    # Get the timeout value for tx only port.
    set timeout [lindex $line 1]
    FlowGraph::Set_Timeout $p_block $timeout
    return
}

proc setportset {line p_block} {
    # The line looks like this
    # Portset {groupX {1 ON} {2 OFF}} {groupY {3 OFF} {4 ON}} ...
    set line [lreplace $line 0 0]
    foreach group $line {
	set name [lindex $group 0]
        set p_group [FlowGraph::Create_Object Portgrp $name ""]
	FlowGraph::Set_Portgrp $p_block $p_group

	foreach token [lrange $group 1 end] {
	    set port [lindex $token 0]
	    set status [lindex $token 1]
	    set p_port [FlowGraph::Get_Group_Port $p_block $port $status]
	    FlowGraph::Add_To_Portgrp $p_group $p_port
	}
    }
    return
}

proc create_circuit {blockfile linkfile circuitname p_socketport} {
    upvar $p_socketport socketport
    global env

    set p_subcircuit [FlowGraph::Create_Object Subcircuit $circuitname "NULL"]
    set p_block ""
    set fd [open $blockfile r]
    while {[gets $fd line] > -1} {
    	if {[string index $line 0] == "#"} {
	    continue
    	}
	# Replace all env(..) in line with the corresponding env var value.
	#set line [subst $line]

    	switch -- [lindex $line 0] \
	    Block {
	    set block_name $circuitname:[lindex $line 1]
    	    set p_block [FlowGraph::Create_Object Block $block_name [lrange $line 2 end]]
	    FlowGraph::Set_Subcircuit $p_subcircuit $p_block

   	} Subcircuit {
	    set b_file [lindex $line 2].block
	    set l_file [lindex $line 2].link
	    set cir_name [lindex $line 1]
	    set p_subcircuit2 [create_circuit $b_file $l_file $circuitname:$cir_name socketport]
	    FlowGraph::Set_Subcircuit $p_subcircuit $p_subcircuit2

   	} InPort {
	    setport $line "In" $p_subcircuit $p_block "localhost"

   	} OutPort {
	    setport $line "Out" $p_subcircuit $p_block "localhost"

	} QueueLen {
	    setportqueue $line $block_name

	} IPAddr {
	    setipaddr $line $p_block

	} Timeout {
	    settimeout $line $p_block

	} Portset {
	    setportset $line $p_block

   	} default { 
	    puts "Invalid keyword [lindex $line 0] detected."
	    exit -1
   	}

    }
    close $fd

    if {0} {
    	Iterate through all blocks to set the
    	- socket port number for all input ports
    	- store the socket port number into the corresponding
          output port
    }

    set fd [open $linkfile r]
    while {[gets $fd line] > -1} {
    	if {[string index $line 0] == "#"} {
	    continue
    	}
    	set fromblock [lindex $line 0]
    	set outport [lindex $line 1]
    	set toblock [lindex $line 2]
    	set inport [lindex $line 3]
	set cur_socketport [FlowGraph::Get_Socketport $circuitname:$toblock $inport]
	if {$cur_socketport == ""} {
    	    FlowGraph::Set_Linkage $circuitname:$fromblock $outport $circuitname:$toblock $inport $socketport
    	    incr socketport
	} else {
    	    FlowGraph::Set_Linkage $circuitname:$fromblock $outport $circuitname:$toblock $inport $cur_socketport
	}
    }
    close $fd
    return $p_subcircuit
}
 
malloc::init
Assert::Init
FlowGraph::Init_Graph

set blockfile [lindex $argv 0]
set linkfile [lindex $argv 1]
set circuitname [lindex $argv 2]
set socketport [lindex $argv 3]
set outfile [lindex $argv 4]
if {$outfile == ""} {
    set outfile "task.out"
}

create_circuit $blockfile $linkfile $circuitname socketport
FlowGraph::Set_Mtc_Port $socketport

FlowGraph::Dump

FlowGraph::Save_Graph fbp.dat

set tasklist [FlowGraph::Get_Block_Ports]
set fd [open $outfile w]
foreach task $tasklist {
    puts $fd $task
}
close $fd

exit 0
