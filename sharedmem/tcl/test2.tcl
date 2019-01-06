proc runit {inport outport size} {
    yield

    set parser(f1) 0
    set parser(f2) 10
    set parser(f3) 20
    set parser(f4) 30
    set count 10
    while {1} {
        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_read_wrapper [port_mgr_get_shmkey $inport] [port_mgr_get_msg $inport]]
            if {$rc} {
                yield
            }
        }

        incr count -1
        foreach idx [lsort [array names parser]] {
            set data [port_mgr_msg_get $inport $parser($idx)]
            if {$count == 0} {
                puts $data
            }
            port_mgr_msg_set $outport $data $parser($idx)
        }
        if {$count == 0} {
            set count 10
        }

        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_write_wrapper [port_mgr_get_shmkey $outport] [port_mgr_get_msg $outport]]
            if {$rc} {
                yield
            }
        }
    }
    return
}

proc checkagain {} {
    checkit
    after 10 checkagain
}

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem 

set inport [lindex $argv 0]
set key1 [lindex $argv 1]
set outport [lindex $argv 2]
set key2 [lindex $argv 3]
set len [lindex $argv 4]
set size [lindex $argv 5]
queue_init
stub_init $key1 $len $size
stub_init $key2 $len $size
port_mgr_init
port_mgr_add $inport $size $key1
port_mgr_add $outport $size $key2
coroutine checkit runit $inport  $outport $size

after idle checkagain

vwait forever 