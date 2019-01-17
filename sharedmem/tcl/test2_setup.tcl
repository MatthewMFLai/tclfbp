proc sendnread {cmd} {
    global g_cids
    foreach sd $g_cids {
        puts $sd $cmd 
        flush $sd
        gets $sd rc
        puts $rc
    }
}

# socket server section
proc server_accept {cid addr port} {
    global g_cids
    puts "accepting $cid"
    lappend g_cids $cid

    if {[llength $g_cids] == 2} {
        after idle runit
    }
}

proc runit {} {
    global g_cids
    global forever
    global g_result 

    sendnread INIT
    sendnread ENABLE
    after 100
    sendnread DISABLE 
    sendnread TEST

    foreach sd $g_cids {
        close $sd
    }
    set forever 1
    set g_result "pass" 
}

package require tcltest
namespace import ::tcltest::*

workingDirectory $env(DISK2)/sharedmem/tcl

test tc-1.1 {test 2 node setup} -setup {

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

set sd [socket -server server_accept 8000]

} -body {

exec tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $env(MSGDEF_HOME)/test/test0.msg:test_tx.tcl:4 OUT-1 $env(MSGDEF_HOME)/test/test0.msg:test_rx.tcl:4 PROGRAM $env(DISK2)/sharedmem/tcl/test2.tcl RUNNING 0 &

exec tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $env(MSGDEF_HOME)/test/test0.msg:test_rx.tcl:4 OUT-1 $env(MSGDEF_HOME)/test/test0.msg:test_tx.tcl:4 PROGRAM $env(DISK2)/sharedmem/tcl/test2.tcl RUNNING 0 &

vwait forever
global g_result 
set g_result 

} -cleanup {

    stub_cleanup test_tx.tcl 
    stub_cleanup test_rx.tcl

} -result {pass}

cleanupTests
