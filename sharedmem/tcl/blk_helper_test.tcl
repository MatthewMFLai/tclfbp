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

    set msgname [Msgdef::Parse $frommsgname]
    set size [Msgdef::Get_Max_Size $msgname]

    set key [Key_helper::Create_key $line]
    Blk_helper::Add_fifo_len $fromname 0 $fromport $key $fifo_len $size
    Blk_helper::Add_fifo_len $toname 1 $toport $key $fifo_len $size
    lappend keys $key
}
close $fd

Blk_helper::Dump
puts [Blk_helper::Gen_str n1]
puts [Blk_helper::Gen_str n2]
#exec tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $env(MSGDEF_HOME)/test/test0.msg:$key1:4 OUT-1 $env(MSGDEF_HOME)/test/test0.msg:$key2:4 PROGRAM $env(DISK2)/sharedmem/tcl/test2.tcl RUNNING 0 &

#exec tclsh node.tcl BLOCK s0:source0 INIT localhost:8000 IN-1 $env(MSGDEF_HOME)/test/test0.msg:$key2:4 OUT-1 $env(MSGDEF_HOME)/test/test0.msg:$key1:4 PROGRAM $env(DISK2)/sharedmem/tcl/test2.tcl RUNNING 0 &

Key_helper::Delete_all_keys

