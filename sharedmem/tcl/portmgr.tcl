namespace eval Portmgr {

variable m_port
variable m_portmsgdef
variable m_porttype

proc Init {} {
    variable m_port
    variable m_portmsgdef
    variable m_porttype
   
    array set m_port {} 
    array set m_portmsgdef {}
    array set m_porttype {} 

    return
}

proc Add {portname porttype msgdef} {
    variable m_port
    variable m_portmsgdef
    variable m_porttype

    if {[info exists m_port($portname)]} {
        return "$portname exists"
    }

    set m_port($portname) ""
    set m_portmsgdef($portname) $msgdef
    set m_porttype($portname) $porttype
    return ""
}

proc Add_Shm {portname shm_key len} {
    variable m_port
    
    if {![info exists m_port($portname)]} {
        return "$portname absent"
    }

    lappend m_port($portname) "$shm_key $len"
    return "" 
}

# Return {shm_key shm_key ... }
proc Get_Shm {portname p_rclist} {
    upvar $p_rclist rclist
    variable m_port
    
    if {![info exists m_port($portname)]} {
        return "$portname absent"
    }

    foreach token $m_port($portname) {
        lappend rclist [lindex $token 0]
    }
    return ""
}

proc Get_Porttype  {portname p_porttype} {
    upvar $p_porttype porttype 
    variable m_porttype
    
    if {![info exists m_porttype($portname)]} {
        return "$portname absent"
    }

    set porttype $m_porttype($portname)
    return ""
}

proc Get_Portmsgdef {portname p_msgdef} {
    upvar $p_msgdef msgdef
    variable m_portmsgdef
    
    if {![info exists m_portmsgdef($portname)]} {
        return "$portname absent"
    }

    set msgdef $m_portmsgdef($portname)
    return ""
}

}
