proc runit {inport outport inport1 outport1} {
    yield
    while {1} {
        set data 0
        while {$data == 0} {
            set data [sv_csr_read_wrapper $inport]
            if {!$data} {
                yield
            }
        }
        sv_csr_write_wrapper $inport 0 
        puts "data1 = $data"
        incr data -1
        sv_csr_write_wrapper $outport $data
 
        set data 0
        while {$data == 0} {
            set data [sv_csr_read_wrapper $inport1]
            if {!$data} {
                yield
            }
        }
        sv_csr_write_wrapper $inport1 0 
        puts "data2 = $data"
        incr data -1
        sv_csr_write_wrapper $outport1 $data 
    }
    return
}

proc checkagain {} {
    checkit
    after 5 checkagain
}

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem 

stub_init [lindex $argv 0]
set inport0 [lindex $argv 1]
set outport0 [lindex $argv 2]
set inport1 [lindex $argv 3]
set outport1 [lindex $argv 4]

coroutine checkit runit $inport0 $outport0 $inport1 $outport1

after idle checkagain

vwait forever 
