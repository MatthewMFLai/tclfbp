# msg definition is in $COMP_HOME/msgdef folder
# format is 
# <attr name> <num of bytes> <default value>
# eg.
# name 10 test0
# version 10 0.1
# f1 10 aaaaaaaa
# ...

namespace eval Msgdef {

variable m_raw_attr
variable m_attr_offset
variable m_max_size

proc Init {} {
    
    variable m_raw_attr
    variable m_attr_offset
    variable m_max_size
 
    array set m_raw_attr {}
    array set m_attr_offset {}
    array set m_max_size {}

    return
}

proc Factory {msgname p_data} {
    upvar $p_data data
    variable m_raw_attr
    
    set rc 0 
    if {![info exists m_raw_attr($msgname)]} {
        return -1 
    }

    foreach tokens $m_raw_attr($msgname) {
        set attr [lindex $tokens 0]
        set defval [lindex $tokens 2]
        set data($attr) $defval
    }

    return $rc
}

proc Parse {filename} {
    variable m_raw_attr
    variable m_attr_offset
    variable m_max_size

    if {![file exists $filename]} {
        puts "$filename does not exist"
        return
    }

    set msgname ""
    set attrlist ""
    set attr_offset_list ""
    set offset 0
    set maxsize 0

    set fd [open $filename r]
    while {[gets $fd line] > -1} {
        set line [string trim $line]
        if {$line == ""} {
            continue
        }
        if {[string index $line 0] == "#"} {
            continue
        }
        
        set attr [lindex $line 0]
        set size [lindex $line 1]
        set defval [lindex $line 2]

        if {$attr == "name"} {
            set msgname $defval
        }

        lappend attrlist $line 
        lappend attr_offset_list "$attr $offset"
        incr maxsize $size
        incr offset $size
    }
    if {$msgname == ""} {
        puts "missing msgdef name!"
        return
    }
    if {[info exists m_max_size($msgname)]} {
        puts "$msgdef already present!"
        return
    }
    set m_max_size($msgname) $maxsize
    set m_attr_offset($msgname) $attr_offset_list
    set m_raw_attr($msgname) $attrlist

    return $msgname
}

proc Get_Attr_Offset {msgname p_data} {
    upvar $p_data data
    variable m_attr_offset 
    
    set rc 0 
    if {![info exists m_attr_offset($msgname)]} {
        return -1 
    }

    foreach tokens $m_attr_offset($msgname) {
        set attr [lindex $tokens 0]
        set offset [lindex $tokens 1]
        set data($attr) $offset
    }

    return $rc
}

proc Get_Max_Size {msgname} {
    variable m_max_size
    
    if {![info exists m_max_size($msgname)]} {
        return 0 
    }
    return $m_max_size($msgname)
}

}
