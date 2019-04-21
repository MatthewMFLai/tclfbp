proc runit {filename curdir} {
    set idx [string last "/" $curdir]
    set newname [string range $curdir [expr $idx + 1] end]

    set fd [open $filename r]
    while {[gets $fd line] > -1} {
        set line [string trim $line]
        if {$line == ""} {
            continue
        } 
        if {[string index $line 0] == "#"} {
            continue
        }
        set key [lindex $line 0]
        set data($key) [lrange $line 1 end]
    }
    close $fd

    # Generate the test blk file.
    set fd [open $curdir/$newname.blk w]
    puts $fd "name $newname"
    puts $fd "filepath $curdir"
    if {[info exists data(outports)]} {
        puts $fd [concat "inports" $data(outports)]
    }
    if {[info exists data(inports)]} {
        puts $fd [concat "outports" $data(inports)]
    }
    close $fd

    # Generate the 2-node node file.
    # tdr = test driver, dut = device under test
    set fd [open $curdir/$newname.node w]
    puts $fd "tdr $curdir/$newname.blk"
    puts $fd "dut $filename"
    close $fd 

    # Generate the 2-node link file.
    # Here data(inports) = dut(inports), data(outports) = dut(outports)
    # Map dut(outports) to tdr(inports), tdr(outports) to dut(inports)
    set fd [open $curdir/$newname.link w]
    set queue_size 4
    if {[info exists data(outports)]} {
        foreach outport $data(outports) {
            set port [lindex $outport 0]
            puts $fd "dut $port tdr $port $queue_size"
        } 
    }
    if {[info exists data(inports)]} {
        foreach inport $data(inports) {
            set port [lindex $inport 0]
            puts $fd "tdr $port dut $port $queue_size"
        } 
    }
    close $fd

    return
}
