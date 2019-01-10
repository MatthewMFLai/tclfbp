proc process {inport outport count} {

    array set msgin {}
    port_read $inport msgin 

    if {$count == 0} {
        foreach idx [array names msgin] {
            puts $msgin($idx)
        }
    }

    port_write $outport msgin
    return
}
