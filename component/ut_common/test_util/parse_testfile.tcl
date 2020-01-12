namespace eval Testfile_Parser {
	variable m_id
	variable m_nodefile
	variable m_linkfile
	variable m_cfgfiles

proc Init {testfile} {
	variable m_id
	variable m_nodefile
	variable m_linkfile
	variable m_cfgfiles
	global env

	if {![file exists $testfile]} {
		puts "Testfile_Parser: $testfile does not exist!"
		return
	}
	set fd [open $testfile r]
	gets $fd m_id
	gets $fd m_nodefile
	set m_nodefile [subst $m_nodefile]	
	gets $fd m_linkfile
	set m_linkfile [subst $m_linkfile]

	set m_cfgfiles ""
	while {[gets $fd line] > -1} {
		lappend m_cfgfiles [subst $line]
	}
	close $fd

	return
}

proc Get_Id {} {
	variable m_id 

	return $m_id
}

proc Get_Nodefile {} {
	variable m_nodefile 

	return $m_nodefile
}

proc Get_Linkfile {} {
	variable m_linkfile 

	return $m_linkfile
}

proc Get_Cfgfiles {} {
	variable m_cfgfiles

	return $m_cfgfiles
}
}
