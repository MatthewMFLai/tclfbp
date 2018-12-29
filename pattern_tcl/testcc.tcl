source cc.tcl
source pvc.tcl

array set node {}
set node(portlist) ""
set node(cclist) ""

proc create_cc {numofports} {
	global node

	set region1 [list "0 0" "19 19"]
	set region2 [list "30 30" "49 49"]
	set region3 [list "60 60" "99 99"]
	set region4 [list "100 100" "499 499"]

	# Create trunk port first. 
	global port$numofports
	array set port$numofports {}
	pvc::idpool_init_member port$numofports
	pvc::idpool_add_region port$numofports $region1
	pvc::idpool_add_region port$numofports $region2
	pvc::idpool_add_region port$numofports $region3
	pvc::idpool_add_region port$numofports $region4
	cc::graph_init_vertex port$numofports

	# Add port variable name to node.
	lappend node(portlist) port$numofports

	# Create each edge port and each cross connect.
	for {set i 0} {$i < $numofports} {incr i} {
		set portname port$i
		set ccname cc$i

		global $portname
		global $ccname
 
		array set $portname {}
		pvc::idpool_init_member $portname
		pvc::idpool_add_region $portname $region1
		cc::graph_init_vertex $portname

		array set $ccname {}
		cc::graph_init_vertex $ccname
		
		# Get the next available end point from edge port
		# and from trunk port.

		set endpt [pvc::idpool_alloc_next_id $portname]
		set ${ccname}(a_endpt) $endpt
		set endpt [pvc::idpool_alloc_next_id port$numofports]	
		set ${ccname}(z_endpt) $endpt

		# Add the cross connect between two ports.
		cc::graph_add_edge $portname port$numofports $ccname

		# Add variable names to node.
		lappend node(portlist) $portname
		lappend node(cclist) $ccname
	}
}

proc save_cc {numofports filename} {
	global node

	set fd [open $filename w]
	foreach portname $node(portlist) { 
		upvar #0 $portname portalias

		puts $fd [list global $portname]
		puts $fd [list array set $portname [array get portalias]]
	}

	foreach ccname $node(cclist) { 
		upvar #0 $ccname ccalias

		puts $fd [list global $ccname]
		puts $fd [list array set $ccname [array get ccalias]]
	}

	# Save node
	puts $fd [list global node]
	puts $fd [list array set node [array get node]]

	close $fd
}

proc save_cc_old {numofports filename} {
	set fd [open $filename w]
	for {set i 0} {$i < $numofports} {incr i} {
		set portname port$i
		set ccname cc$i

		upvar #0 $portname portalias
		upvar #0 $ccname ccalias

		puts $fd [list global $portname]
		puts $fd [list array set $portname [array get portalias]]
		puts $fd [list global $ccname]
		puts $fd [list array set $ccname [array get ccalias]]
	}
	set portname port$numofports
	upvar #0 $portname portalias

	puts $fd [list global $portname]
	puts $fd [list array set $portname [array get portalias]]
	close $fd
}

proc load_cc {filename} {
	source $filename
}
