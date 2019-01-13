proc port_read {port p_msgin} {
    upvar $p_msgin msgin

    Portmgr::Get_Portmsgdef $port msgname
    Portmgr::Get_Shm $port keylist
    set rc 1 
    while {$rc != 0} {
        foreach shmkey $keylist {
            set rc [sv_csr_read_wrapper $shmkey [port_mgr_get_msg $port]]
            if {$rc == 0} {
                break
            }
        }
        if {$rc} {
            yield
        }
    }

    array set tmpdata {}
    Msgdef::Get_Attr_Offset $msgname tmpdata
    foreach attr [array names tmpdata] {
        set msgin($attr) [port_mgr_msg_get $port $tmpdata($attr)]
    }
}

proc port_write {port p_msgout} {
    upvar $p_msgout msgout

    Portmgr::Get_Portmsgdef $port msgname
    array set tmpdata {}
    Msgdef::Get_Attr_Offset $msgname tmpdata
    foreach attr [array names tmpdata] {
        if {![info exists msgout($attr)]} {
            continue
        }
        port_mgr_msg_set $port $msgout($attr) $tmpdata($attr)
    }

    Portmgr::Get_Shm $port keylist
    set rc 1 
    while {$rc != 0} {
        foreach shmkey $keylist {
            set rc [sv_csr_write_wrapper $shmkey [port_mgr_get_msg $port]]
            if {$rc == 0} {
                break
            }
        }
        if {$rc} {
            yield
        }
    }
}

proc runit {} {
    yield

    set count 10
    while {1} {

        incr count -1
        process $count
        if {$count == 0} {
            set count 10
        }
    }
 
    return
}

proc checkagain {} {
    checkit
    after 10 checkagain
}

source portmgr.tcl
Portmgr::Init
source msgdef.tcl
Msgdef::Init
load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem 
queue_init
port_mgr_init

# argument data looks like this:
# tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $MSGDEF_HOME/test/test0.msg:test_tx.tcl:4 OUT-1 $MSGDEF_HOME/test/test0.msg:test_rx.tcl:4 PROGRAM $DISK2/sharedmem/tcl/test2.tcl
#
# Each port data contains the following info pieces
# <port name> <msgdef : sharedmem key : length : sharedmem key : length :...>
array set argdata $argv 

# All ports are prefixed by "IN-" and "OUT-"
foreach porttype "IN OUT" {
    foreach port [array names argdata "$porttype-*"] {
        set tokens [split $argdata($port) ":"]

        set msgfile [lindex $tokens 0]
        set msgname [Msgdef::Parse $msgfile]
        set size [Msgdef::Get_Max_Size $msgname]
        Portmgr::Add $port $porttype $msgname
        port_mgr_add $port $size

        array set tmpdata [lrange $tokens 1 end]  
        foreach shmkey [array names tmpdata] {
            set len $tmpdata($shmkey)
            Portmgr::Add_Shm $port $shmkey $len
            stub_init $shmkey $len $size
        }
        unset tmpdata
    }
} 

set appfile $argdata(PROGRAM)
source $appfile

coroutine checkit runit

after idle checkagain

vwait forever 
