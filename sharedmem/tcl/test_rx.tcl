proc runit {size} {
    global p_output
    yield
    while {1} {
        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_read_wrapper $p_output]
            if {$rc} {
                yield
            }
        }
        print_output $size
    }
    return
}

proc checkagain {} {
    checkit
    after 10 checkagain
}

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem 

set key [lindex $argv 0]
set len [lindex $argv 1]
set size [lindex $argv 2]
stub_init $key $len $size
test_helper_init $size 

coroutine checkit runit $size

after idle checkagain

vwait forever 
