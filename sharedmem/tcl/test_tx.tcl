proc runit {size} {
    yield
    set val 0
    while {1} {
        fill_input $val $size
        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_write_wrapper $p_input]
            if {$rc} {
                yield
            }
        }
        incr val $size
        if ($val == 256) {
            set val 0
        }
    }
    return
}

proc checkagain {} {
    checkit
    after 5 checkagain
}

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem 

set key [lindex $argv 0]
set len [lindex $argv 1]
set size [lindex $argv 2]
stub_init $key $len $size
test_helper_int $size 

coroutine checkit runit $size

after idle checkagain

vwait forever 
