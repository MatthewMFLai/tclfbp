# IP module to support operations on manipulating
# the IP (info pa]cket). 
# Assumption: the memory for the IP is allocated by
# malloc.tcl.

namespace eval ip {

    variable m_source_list
    variable m_sink_list
    variable m_malloc

    proc init {malloc_name} {
    	variable m_source_list
    	variable m_sink_list
	variable m_malloc

	set m_source_list ""	
	set m_sink_list ""
	set m_malloc $malloc_name
	${m_malloc}::init
    }
	
    proc source {} {
    	variable m_source_list
	variable m_malloc 

	set ip [${m_malloc}::getmem]
	lappend $m_source_list $ip
	return $ip
    }

    proc sink {p_ip} {
    	variable m_sink_list 
	variable m_malloc 

 	lappend $m_sink_list $p_ip
	${m_malloc}::freemem $p_ip
    }

    proc clone {p_ip} {
    	variable m_malloc

	set clone_ip [${m_malloc}::copymem $p_ip] 
	return $clone_ip
    }

    proc assemble {tokens} {
	variable m_malloc 

	set ip [${m_malloc}::getmem $tokens]
	
	return $ip
    }

    proc destroy {p_ip} {
	variable m_malloc 

	${m_malloc}::freemem $p_ip
    }

    proc serialize {p_ip} {
	variable m_malloc 

	return [${m_malloc}::flatmem $p_ip]
    }
}
