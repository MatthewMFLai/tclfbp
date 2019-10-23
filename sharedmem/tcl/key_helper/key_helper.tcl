namespace eval Key_helper {

    variable m_keys_dir
    variable m_keys

proc Init {key_dir} {
    variable m_keys_dir
    variable m_keys

    set m_keys_dir $key_dir
    set m_keys ""
    return
}

# Expect space separated, unique string input for creating a key
# eg.
# n1 1 n2 1
proc Create_key {id idxstr} {
    variable m_keys_dir
    variable m_keys
    
    set key $m_keys_dir/$id-[join $idxstr "-"]
    if {[lsearch $m_keys $key] != -1} {
        puts "key for $idxstr already exists!"
        return
    }

    lappend m_keys $key
    set fd [open $key w]
    puts $fd $idxstr 
    close $fd
    return $key
}

proc Delete_key {key} {
    variable m_keys
    
    set rc [lsearch $m_keys $key]
    if {$rc == -1} {
        puts "$key does not exist!"
        return
    }

    set m_keys [lreplace $m_keys $rc $rc]
    file delete -force $key
    return
}

proc Get_key {id idxstr} {
    variable m_keys_dir
    variable m_keys
    
    set key $m_keys_dir/$id-[join $idxstr "-"]
    if {[lsearch $m_keys $key] != -1} {
        return ""
    }

    return $key
}

proc Get_all_keys {id} {
    variable m_keys
    variable m_keys_dir

	set rc ""
	foreach key $m_keys {
		if {[string first "$m_keys_dir/$id-" $key] == 0} {
			lappend rc $key
		}
	}	
	return $rc
}
 
proc Delete_all_keys {id} {
    variable m_keys_dir
    variable m_keys
    
	set delete_keys ""
    foreach key $m_keys { 
		if {[string first "$m_keys_dir/$id-" $key] == 0} {
        	file delete -force $key
			lappend delete_keys $key
		}
    }

	foreach key $delete_keys {
		set idx [lsearch $m_keys $key]
		set m_keys [lreplace $m_keys $idx $idx]
	}
    return
}

}
