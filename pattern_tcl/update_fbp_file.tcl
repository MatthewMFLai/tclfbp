#!/bin/sh 
# \
exec tclsh $0 $@

# This script provides a backdoor access to update the version
# number of the factory components to the most recent version
# as specified in the passed in argument for the factory directory.
# Run this script right after 
# - make release is performed in the component directory.
# - update_all in update_production_nodes.tcl has been executed.
# - update all components to use the most recent version.

proc parseit {data p_prefix p_compname p_version} {
    upvar $p_prefix prefix
    upvar $p_compname compname
    upvar $p_version version

    # data should look like
    # $env(FACTORY)/basic/sink/0.01

    set idx [string first "/" $data]
    set idx2 [string last "/" $data]
    incr idx -1
    set prefix [string range $data 0 $idx]

    incr idx 1 
    incr idx2 -1
    set compname [string range $data $idx $idx2]

    incr idx2 2
    set version [string range $data $idx2 end]
    return
}

proc parseit2 {data p_prefix p_compname} {
    upvar $p_prefix prefix
    upvar $p_compname compname

    # data should look like
    # $env(DISK2)/component/basic/sink

    set idx [string first "/" $data]
    incr idx
    set idx2 [string first "/" $data $idx]
    incr idx2 -1
    set prefix [string range $data 0 $idx2]

    incr idx2
    set compname [string range $data $idx2 end]
    return
}

proc buildit {prefix compname version} {
    return $prefix$compname/$version
}

proc run_it {tmpdir factorydir infile outfile convert_all} {
    Updater::Init $tmpdir $factorydir
    set fd [open $infile r]
    set script [read $fd]
    close $fd

    set fd [open $outfile w]
    set linelist [split $script "\n"]
    foreach line $linelist {
	if {[string first "array set" $line] == 0} {
	    eval $line
	} else {
	    puts $fd $line
	}
    }
    foreach filepath [array names m_block "*,filepath"] {
	set token $m_block($filepath)
	if {[string first "FACTORY" $token] == -1} {
	    if {$convert_all != "yes"} {
	    	continue
	    }
	    # Only process components. 
	    if {[string first "/component" $token] == -1} {
	        continue
	    }
	    # Convert env(DISK2)/component to env(FACTORY)
	    parseit2 $token prefix compname
	    regsub "DISK2" $prefix "FACTORY" prefix
	    regsub "/component" $prefix "" prefix
	    set token [buildit $prefix $compname \
                       [Updater::Get_comp_version $compname]]
	    set m_block($filepath) $token
	    continue 
	}

	parseit $token prefix compname version
	if {[Updater::Get_comp_version $compname] != $version} {
	    set token [buildit $prefix $compname \
                       [Updater::Get_comp_version $compname]]
	    set m_block($filepath) $token
	}
    }
    set line "array set m_block \"[array get m_block]\""
    regsub -all {\$} $line "\\\$" line
    puts $fd $line 
    if {[array get m_portqueue] != ""} {
        set line "array set m_portqueue \"[array get m_portqueue]\""
    	puts $fd $line
    }
    close $fd
    return ""
}

source $env(PATTERN_HOME)/update_production_nodes.tcl

set tmpdir [lindex $argv 0]
set factorydir [lindex $argv 1]
set infile [lindex $argv 2]
if {![file exists $infile]} {
    puts "$infile does not exist."
    exit -1
}
set outfile [lindex $argv 3]
set convert_all [lindex $argv 4]

if {[catch {run_it $tmpdir $factorydir $infile $outfile $convert_all} rc]} {
    puts "rc = $rc"
    exit -1
}
exit 0
