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
array set msgattr {}
Msgdef::Get_Attr_Offset $msgname msgattr

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem

set size [Msgdef::Get_Max_Size $msgname] 
set len 4 
queue_init
port_mgr_init

port_mgr_add out1 $size
port_mgr_add out2 $size

stub_init test_tx.tcl $len $size 
stub_clear test_tx.tcl $len $size

array set msgdata {}
Msgdef::Factory $msgname msgdata
foreach idx [array names msgdata] {
    port_mgr_msg_set out1 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

array set msgdata {}
Msgdef::Factory $msgname msgdata
set msgdata(f1) 11111111
set msgdata(f2) 22222222 
set msgdata(f3) 33333333 
set msgdata(f4) 44444444 
foreach idx [array names msgdata] {
    port_mgr_msg_set out1 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

array set msgdata {}
Msgdef::Factory $msgname msgdata
set msgdata(f1) eeeeeeee 
set msgdata(f2) ffffffff 
set msgdata(f3) gggggggg 
set msgdata(f4) hhhhhhhh 
foreach idx [array names msgdata] {
    port_mgr_msg_set out1 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

array set msgdata {}
Msgdef::Factory $msgname msgdata
set msgdata(f1) 55555555 
set msgdata(f2) 66666666 
set msgdata(f3) 77777777 
set msgdata(f4) 88888888 
foreach idx [array names msgdata] {
    port_mgr_msg_set out1 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper test_tx.tcl [port_mgr_get_msg out1]

stub_init test_rx.tcl $len $size 
stub_clear test_rx.tcl $len $size

array set msgdata {}
Msgdef::Factory $msgname msgdata
foreach idx [array names msgdata] {
    port_mgr_msg_set out2 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper test_rx.tcl [port_mgr_get_msg out2]

array set msgdata {}
Msgdef::Factory $msgname msgdata
set msgdata(f1) 11111111 
set msgdata(f2) 22222222 
set msgdata(f3) 33333333 
set msgdata(f4) 44444444 
foreach idx [array names msgdata] {
    port_mgr_msg_set out2 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper test_rx.tcl [port_mgr_get_msg out2]

array set msgdata {}
Msgdef::Factory $msgname msgdata
set msgdata(f1) eeeeeeee 
set msgdata(f2) ffffffff 
set msgdata(f3) gggggggg 
set msgdata(f4) hhhhhhhh 
foreach idx [array names msgdata] {
    port_mgr_msg_set out2 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper test_rx.tcl [port_mgr_get_msg out2]

array set msgdata {}
Msgdef::Factory $msgname msgdata
set msgdata(f1) 55555555 
set msgdata(f2) 66666666 
set msgdata(f3) 77777777 
set msgdata(f4) 88888888 
foreach idx [array names msgdata] {
    port_mgr_msg_set out2 $msgdata($idx) $msgattr($idx)
}
unset msgdata

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
