#!/bin/sh
# \
exec tclsh $0 $@

set outfile [lindex $argv 0]
set dimension [lindex $argv 1]

set space " "
set vertex_str ""
set p_vertex_str ""
set suffix 1
while {$suffix <= $dimension} {
    append vertex_str vertex_$suffix
    append vertex_str $space
    append p_vertex_str p_vertex_$suffix
    append p_vertex_str $space
    incr suffix
}
set vertex_str [string range $vertex_str 0 end-1]
set p_vertex_str [string range $p_vertex_str 0 end-1]

set fd [open $outfile w]

# Utility intersection routine.
puts $fd {proc lintersect {a b} {
   foreach e $a {
        set x($e) {}
   }
   set result {}
   foreach e $b {
       if {[info exists x($e)]} {
           lappend result $e
       }
   }
   return $result
}}
puts $fd ""

# add_plane routine
set arg_str "$p_vertex_str p_plane"
puts $fd "proc add_plane \{$arg_str\} \{"
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    upvar #0 \$p_vertex_$suffix vertex_$suffix"
    incr suffix
}
puts $fd "    upvar #0 \$p_plane plane"
puts $fd ""
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    set plane(&vertex_$suffix) \$p_vertex_$suffix"
    puts $fd "    lappend vertex_$suffix\(&plane_$suffix\_list\) \$p_plane"
    incr suffix 
}
puts $fd "\}"
puts $fd ""
# remove_plane routine
set arg_str "$p_vertex_str p_plane"
puts $fd "proc remove_plane \{$arg_str\} \{"
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    upvar #0 \$p_vertex_$suffix vertex_$suffix"
    incr suffix
}
puts $fd "    upvar #0 \$p_plane plane"
puts $fd ""
puts $fd "    # Robustness checks."
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    if \{\$plane(&vertex_$suffix) != \$p_vertex_$suffix\} \{"
    puts $fd "        return -1"
    puts $fd "    \}"
    puts $fd ""
    incr suffix
}


set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    set plane(&vertex_$suffix) \"\""
    incr suffix
}

set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    set data \$vertex_$suffix\(&plane_$suffix\_list\)"
    puts $fd "    set idx \[lsearch \$data \$p_plane\]"
    puts $fd "    if \{\$idx > -1\} \{"
    puts $fd "        set vertex_$suffix\(&plane_$suffix\_list\) \[lreplace \$data \$idx \$idx\]"
    puts $fd "    \} else \{"
    puts $fd "        return -2"
    puts $fd "    \}"
    puts $fd ""
    incr suffix
}

puts $fd "    return 0"
puts $fd "\}"
puts $fd ""

# get_plane routine
set arg_str $p_vertex_str
puts $fd "proc get_plane \{$arg_str\} \{"
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    upvar #0 \$p_vertex_$suffix vertex_$suffix"
    incr suffix
}
puts $fd ""
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "    set planelist$suffix \$vertex_$suffix\(&plane_$suffix\_list\)"
    incr suffix
}
puts $fd ""
puts $fd "    set rc \$planelist1"
set suffix 2
while {$suffix <= $dimension} {
    puts $fd "    set rc \[lintersect \$planelist$suffix \$rc\]"
    incr suffix
}
puts $fd {    return $rc}
puts $fd "\}"
puts $fd ""

# get_vertex_* routines
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "proc get_vertex_$suffix \{p_plane\} \{"
    puts $fd {    upvar #0 $p_plane plane}
    puts $fd ""
    puts $fd "    return \$plane(&vertex_$suffix)"
    puts $fd "\}"
    puts $fd ""
    incr suffix
}

# get_plane_iterator routine
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "proc get_plane_$suffix\_iterator \{p_vertex\} \{"
    puts $fd "    upvar #0 \$p_vertex vertex"
    puts $fd ""
    puts $fd "    return \$vertex\(&plane_$suffix\_list\)"
    puts $fd "\}"
    puts $fd ""
    incr suffix
}

# init_plane routine
puts $fd "proc init_plane \{p_plane\} \{"
puts $fd {   upvar #0 $p_plane plane}
set suffix 1
while {$suffix <= $dimension} {
    puts $fd "   set plane(&vertex_$suffix) \"\" "
    incr suffix
}
puts $fd "\}"
puts $fd ""

# init_vertex routine
puts $fd "proc init_vertex \{p_vertex\} \{"
puts $fd {   upvar #0 $p_vertex vertex}
set suffix 1
while {$suffix <= $dimension} {
   puts $fd "    set vertex(&plane_$suffix\_list) \"\" "
    incr suffix
}
puts $fd "\}"
puts $fd ""


close $fd
exit 0
