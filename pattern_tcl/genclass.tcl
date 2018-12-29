#!/bin/sh
# \
exec tclsh $0 $@

if {0} {
    This script generates something similar to generic.tcl,
    but with specific attribute names. The argument to this
    script is a text file containing the attribute names,
    each name in a separate line. The generated file will
    assume the name of the given text file.
}

if { [llength $argv] != 1 } {
    puts "Usage: genpattern attrnamefile"
    puts "Example: genclass atmvlancc.dat"
    exit -1
}

set filename [lindex $argv 0]
set classname [lindex [split $filename "."] 0]

set fd [open $filename r]
set fd2 [open $classname.tcl w]
set attrnamelist ""

while {[gets $fd attrname] > -1} {
    # Skip comments.
    if {[string first "#" $attrname] > -1} {
	continue
    }
    # Trim white spaces.
    set attrname [string trim $attrname]
    # Generate the set procedure.
    puts $fd2 "proc set_$attrname \{p_generic attr\} \{"
    puts $fd2 "    upvar #0 \$p_generic generic"
    puts $fd2 ""
    puts $fd2 "    set generic(&$attrname) \$attr"
    puts $fd2 "\}"
    puts $fd2 ""
 
    # Generate the get procedure.
    puts $fd2 "proc get_$attrname \{p_generic\} \{"
    puts $fd2 "    upvar #0 \$p_generic generic"
    puts $fd2 ""
    puts $fd2 "    return \$generic(&$attrname)"
    puts $fd2 "\}"
    puts $fd2 ""

    lappend attrnamelist $attrname
}
close $fd

# Generate the generic set procedure.
puts $fd2 "proc set_all \{p_generic p_data\} \{"
puts $fd2 "    upvar \$p_data data"
puts $fd2 ""
puts $fd2 "    set attrlist \[getattrname\]"
puts $fd2 "    foreach attr \[array names data\] \{"
puts $fd2 "        if \{\[lsearch \$attrlist \$attr\] > -1\} \{"
puts $fd2 "           set_\$attr \$p_generic \$data(\$attr)"
puts $fd2 "        \}"
puts $fd2 "    \}"
puts $fd2 "    return"
puts $fd2 "\}"
puts $fd2 ""

# Generate the init procedure.
puts $fd2 "proc init \{p_generic\} \{"
puts $fd2 "    upvar #0 \$p_generic generic"
foreach attrname $attrnamelist {
    puts $fd2 "    set generic(&$attrname) \"\""
}
puts $fd2 "\}"
puts $fd2 ""

# Generate the remove procedure.
puts $fd2 "proc remove \{p_generic\} \{"
puts $fd2 "    upvar #0 \$p_generic generic"
foreach attrname $attrnamelist {
    puts $fd2 "    unset generic(&$attrname)"
}
puts $fd2 "\}"
puts $fd2 ""

# Generate the procedure to return list of attribute names.
puts $fd2 "proc getattrname \{\} \{"
puts $fd2 "    return \"$attrnamelist\""
puts -nonewline $fd2 "\}"

close $fd2
exit 0
