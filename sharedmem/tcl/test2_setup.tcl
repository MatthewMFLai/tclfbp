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

load $env(TCLSHAREDMEM)/tclsharedmem.so tclsharedmem
source msgdef.tcl
source blk_helper.tcl
source key_helper.tcl

Msgdef::Init
Blk_helper::Init
Key_helper::Init /tmp

set compdir $env(COMP_HOME)/test
set keys ""

set fd [open $compdir/test2.node r]
while {[gets $fd line] > -1} {
    set nodename [lindex $line 0]
    set compfile [subst [lindex $line 1]]
    set compname [Blk_helper::Parse $compfile]
    Blk_helper::Add_node $nodename $compname
}
close $fd


set fd [open $compdir/test2.link r]
while {[gets $fd line] > -1} {
    set fromname [lindex $line 0]
    set toname [lindex $line 2]
    set fromport [lindex $line 1]
    set toport [lindex $line 3]
    set fifo_len [lindex $line 4]

    set frommsgname [Blk_helper::Get_port_msgdef $fromname 0 $fromport]
    set tomsgname [Blk_helper::Get_port_msgdef $toname 1 $toport]
    if {$frommsgname != $tomsgname} {
        puts "$line not professed for incompatible msgdef $frommsgname vs $tomsgname"
        continue
    }

    set msgname [Msgdef::Parse $tomsgname]
    set size [Msgdef::Get_Max_Size $msgname]

    set key [Key_helper::Create_key $line]
    Blk_helper::Add_fifo_len $fromname 0 $fromport $key $fifo_len $size
    Blk_helper::Add_fifo_len $toname 1 $toport $key $fifo_len $size
    lappend keys $key
}
close $fd

set key1 [lindex $keys 0]
set key2 [lindex $keys 1]

array set msgattr {}
Msgdef::Get_Attr_Offset $msgname msgattr

set size [Msgdef::Get_Max_Size $msgname] 
set len 4 
queue_init
port_mgr_init

port_mgr_add out1 $size
port_mgr_add out2 $size

# Allocate the sharedmem with the key reference.
foreach token [Blk_helper::Get_keys] {
    set key [lindex $token 0]
    set len [lindex $token 1]
    set size [lindex $token 2]

    stub_init $key $len $size 
    stub_clear $key $len $size
}

array set msgdata {}
Msgdef::Factory $msgname msgdata
foreach idx [array names msgdata] {
    port_mgr_msg_set out1 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper $key1 [port_mgr_get_msg out1]

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

sv_csr_write_wrapper $key1 [port_mgr_get_msg out1]

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

sv_csr_write_wrapper $key1 [port_mgr_get_msg out1]

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

sv_csr_write_wrapper $key1 [port_mgr_get_msg out1]

array set msgdata {}
Msgdef::Factory $msgname msgdata
foreach idx [array names msgdata] {
    port_mgr_msg_set out2 $msgdata($idx) $msgattr($idx)
}
unset msgdata

sv_csr_write_wrapper $key2 [port_mgr_get_msg out2]

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

sv_csr_write_wrapper $key [port_mgr_get_msg out2]

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

sv_csr_write_wrapper $key2 [port_mgr_get_msg out2]

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

sv_csr_write_wrapper $key2 [port_mgr_get_msg out2]

set sd [socket -server server_accept 8000]

} -body {

set cmd "exec tclsh node.tcl BLOCK n1 INIT localhost:8000 "
append cmd [Blk_helper::Gen_str n1]
append cmd " RUNNING 0 &"
eval $cmd

set cmd "exec tclsh node.tcl BLOCK n2 INIT localhost:8000 "
append cmd [Blk_helper::Gen_str n2]
append cmd " RUNNING 0 &"
eval $cmd

vwait forever
global g_result 
set g_result 

} -cleanup {

    stub_cleanup $key1 
    stub_cleanup $key2
    Key_helper::Delete_all_keys

} -result {pass}

cleanupTests
