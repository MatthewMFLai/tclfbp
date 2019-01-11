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

proc runit {inport outport} {
    yield

    set count 10
    while {1} {

        incr count -1
        process $inport $outport $count
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

set inport [lindex $argv 0]
set key1 [lindex $argv 1]
set outport [lindex $argv 2]
set key2 [lindex $argv 3]
set len [lindex $argv 4]
set msgfile [lindex $argv 5]
set appfile [lindex $argv 6]

source $appfile

set msgname [Msgdef::Parse $msgfile]
set size [Msgdef::Get_Max_Size $msgname]

Portmgr::Add $inport IN $msgname
Portmgr::Add_Shm $inport $key1 $len
Portmgr::Add $outport OUT $msgname
Portmgr::Add_Shm $outport $key2 $len

queue_init
stub_init $key1 $len $size
stub_init $key2 $len $size
port_mgr_init
port_mgr_add $inport $size 
port_mgr_add $outport $size
coroutine checkit runit $inport  $outport

after idle checkagain

vwait forever 
