source msgdef.tcl
Msgdef::Init
set msgfile $env(COMP_HOME)/msgdef/test/test0.msg
set msgname [Msgdef::Parse $msgfile]

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem

set size [Msgdef::Get_Max_Size $msgname] 
set len 4 
queue_init
port_mgr_init

port_mgr_add out1 $size
port_mgr_add out2 $size

stub_init test_tx.tcl $len $size 
stub_clear test_tx.tcl $len $size

port_mgr_msg_set out1 aaaaaaaa 0 
port_mgr_msg_set out1 bbbbbbbb 10 
port_mgr_msg_set out1 cccccccc 20 
port_mgr_msg_set out1 dddddddd 30
port_mgr_msg_set out1 test0 40
port_mgr_msg_set out1 0.1 50

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

port_mgr_msg_set out1 11111111 0 
port_mgr_msg_set out1 22222222 10 
port_mgr_msg_set out1 33333333 20 
port_mgr_msg_set out1 44444444 30
port_mgr_msg_set out1 test0 40
port_mgr_msg_set out1 0.1 50

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

port_mgr_msg_set out1 eeeeeeee 0 
port_mgr_msg_set out1 ffffffff 10 
port_mgr_msg_set out1 gggggggg 20 
port_mgr_msg_set out1 hhhhhhhh 30
port_mgr_msg_set out1 test0 40
port_mgr_msg_set out1 0.1 50

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

port_mgr_msg_set out1 55555555 0 
port_mgr_msg_set out1 66666666 10 
port_mgr_msg_set out1 77777777 20 
port_mgr_msg_set out1 88888888 30
port_mgr_msg_set out1 test0 40
port_mgr_msg_set out1 0.1 50

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

stub_init test_rx.tcl $len $size 
stub_clear test_rx.tcl $len $size

port_mgr_msg_set out2 aaaaaaaa 0 
port_mgr_msg_set out2 bbbbbbbb 10 
port_mgr_msg_set out2 cccccccc 20 
port_mgr_msg_set out2 dddddddd 30
port_mgr_msg_set out2 test0 40
port_mgr_msg_set out2 0.1 50

sv_csr_write_wrapper test_rx.tcl [port_mgr_get_msg out2]

port_mgr_msg_set out2 11111111 0 
port_mgr_msg_set out2 22222222 10 
port_mgr_msg_set out2 33333333 20 
port_mgr_msg_set out2 44444444 30
port_mgr_msg_set out2 test0 40
port_mgr_msg_set out2 0.1 50

sv_csr_write_wrapper test_rx.tcl [port_mgr_get_msg out2]

port_mgr_msg_set out2 eeeeeeee 0 
port_mgr_msg_set out2 ffffffff 10 
port_mgr_msg_set out2 gggggggg 20 
port_mgr_msg_set out2 hhhhhhhh 30
port_mgr_msg_set out2 test0 40
port_mgr_msg_set out2 0.1 50

sv_csr_write_wrapper test_rx.tcl [port_mgr_get_msg out2]

port_mgr_msg_set out2 55555555 0 
port_mgr_msg_set out2 66666666 10 
port_mgr_msg_set out2 77777777 20 
port_mgr_msg_set out2 88888888 30
port_mgr_msg_set out2 test0 40
port_mgr_msg_set out2 0.1 50

sv_csr_write_wrapper test_rx.tcl [port_mgr_get_msg out2]
