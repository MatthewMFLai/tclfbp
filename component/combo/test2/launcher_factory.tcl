namespace eval Launcher_Obj {

variable m_template
variable m_mapper
variable m_count
variable m_name

proc Init {filename} {
    variable m_template
    variable m_mapper
    variable m_count
    variable m_name

    set rc ""
    if {![file exists $filename]} {
	set rc "Launcher_Obj - $filename does not exist!"
        return $rc
    }

    set fd [open $filename r]
    set m_template [read $fd]
    close $fd

    set m_name "::Launcher_"
    array set m_mapper {}
    set m_count 1
 
    return $rc
}

proc Create {id} {
    variable m_template
    variable m_mapper
    variable m_count
    variable m_name

    if {[lsearch [array names m_mapper] $id] != -1} {
	set rc "Launcher_Factory ERROR $id duplicate id"
	return $rc
    }
    regsub "%%%" $m_template $m_name$m_count template
    if {[catch {eval $template} rc]} {
	return "Launcher_Factory ERROR $rc"
    }
    set m_mapper($id) $m_name$m_count
    set rc $m_name$m_count
    incr m_count
    return $rc
}

proc Delete {id} {
    variable m_mapper

    set rc ""
    if {[info exists m_mapper($id)]} {
    	namespace delete $m_mapper($id)
	unset m_mapper($id)
    } else {
	set rc "Launcher_Factory ERROR graph $id not present."
    }
    return $rc
}

proc Get_Obj {id} {
    variable m_mapper

    set rc ""
    if {[info exists m_mapper($id)]} {
	set rc $m_mapper($id)
    }
    return $rc
}

proc Get_All_Id {} {
    variable m_mapper

    return [array names m_mapper] 
}

}
