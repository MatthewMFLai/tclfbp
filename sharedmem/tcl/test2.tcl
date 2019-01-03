proc runit {key1 key2 size} {
    global p_input
    global p_output
    yield

    while {1} {
        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_read_wrapper $key1 $p_output]
            if {$rc} {
                yield
            }
        }
        print_output $size

        out_to_in $size

        set rc 1 
        while {$rc != 0} {
            set rc [sv_csr_write_wrapper $key2 $p_input]
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

set key1 [lindex $argv 0]
set key2 [lindex $argv 1]
set len [lindex $argv 2]
set size [lindex $argv 3]
queue_init
stub_init $key1 $len $size
stub_init $key2 $len $size
test_helper_init $size 

coroutine checkit runit $key1 $key2 $size

after idle checkagain

vwait forever 
