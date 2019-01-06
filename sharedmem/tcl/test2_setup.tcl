load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem

set size 40 
set len 4 
queue_init
port_mgr_init

port_mgr_add out1 $size test_tx.tcl
port_mgr_add out2 $size test_rx.tcl

stub_init test_tx.tcl $len $size 
stub_clear test_tx.tcl $len $size

port_mgr_msg_set out1 aaaaaaaa 0 
port_mgr_msg_set out1 bbbbbbbb 10 
port_mgr_msg_set out1 cccccccc 20 
port_mgr_msg_set out1 dddddddd 30

sv_csr_write_wrapper [port_mgr_get_shmkey out1] [port_mgr_get_msg out1]

port_mgr_msg_set out1 11111111 0 
port_mgr_msg_set out1 22222222 10 
port_mgr_msg_set out1 33333333 20 
port_mgr_msg_set out1 44444444 30

sv_csr_write_wrapper [port_mgr_get_shmkey out1] [port_mgr_get_msg out1]

port_mgr_msg_set out1 eeeeeeee 0 
port_mgr_msg_set out1 ffffffff 10 
port_mgr_msg_set out1 gggggggg 20 
port_mgr_msg_set out1 hhhhhhhh 30

sv_csr_write_wrapper [port_mgr_get_shmkey out1] [port_mgr_get_msg out1]

port_mgr_msg_set out1 55555555 0 
port_mgr_msg_set out1 66666666 10 
port_mgr_msg_set out1 77777777 20 
port_mgr_msg_set out1 88888888 30

sv_csr_write_wrapper [port_mgr_get_shmkey out1] [port_mgr_get_msg out1]

stub_init test_rx.tcl $len $size 
stub_clear test_rx.tcl $len $size

port_mgr_msg_set out2 aaaaaaaa 0 
port_mgr_msg_set out2 bbbbbbbb 10 
port_mgr_msg_set out2 cccccccc 20 
port_mgr_msg_set out2 dddddddd 30

sv_csr_write_wrapper [port_mgr_get_shmkey out2] [port_mgr_get_msg out2]

port_mgr_msg_set out2 11111111 0 
port_mgr_msg_set out2 22222222 10 
port_mgr_msg_set out2 33333333 20 
port_mgr_msg_set out2 44444444 30

sv_csr_write_wrapper [port_mgr_get_shmkey out2] [port_mgr_get_msg out2]

port_mgr_msg_set out2 eeeeeeee 0 
port_mgr_msg_set out2 ffffffff 10 
port_mgr_msg_set out2 gggggggg 20 
port_mgr_msg_set out2 hhhhhhhh 30

sv_csr_write_wrapper [port_mgr_get_shmkey out2] [port_mgr_get_msg out2]

port_mgr_msg_set out2 55555555 0 
port_mgr_msg_set out2 66666666 10 
port_mgr_msg_set out2 77777777 20 
port_mgr_msg_set out2 88888888 30

sv_csr_write_wrapper [port_mgr_get_shmkey out2] [port_mgr_get_msg out2]
