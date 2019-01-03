load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem
set val 0
set size 4
set len 8
queue_init
test_helper_init $size 
stub_init test_tx.tcl $len $size 
stub_clear test_tx.tcl $len $size

for {set i 0} {$i < $len} {incr i} {
    fill_input $val $size
    sv_csr_write_wrapper test_tx.tcl $p_input
    incr val $size
}

stub_init test_rx.tcl $len $size 
stub_clear test_rx.tcl $len $size
for {set i 0} {$i < $len} {incr i} {
    fill_input $val $size
    sv_csr_write_wrapper test_rx.tcl $p_input
    incr val $size
}
