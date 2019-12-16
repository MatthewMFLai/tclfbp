namespace eval Cfg {
	variable m_cfg

proc Init {cfgfile} {
	variable m_cfg
	
	foreach idx [array names m_cfg] {
		unset m_cfg($idx)
	}

	if {[file exists $cfgfile]} {
		source $cfgfile
	} else {
		puts "cfg_if: $cfgfile not present!"
	}
	return
}

proc Get_Ip {} {
	variable m_cfg

	set ipname $m_cfg(ip)
	if {$ipname == "localhost"} {
		set ipaddr "localhost"
	} else {
		set ipaddr $m_cfg($ipname)
	}
	set port $m_cfg(server_accept)
	return "$ipname $ipaddr $port"
}

}
