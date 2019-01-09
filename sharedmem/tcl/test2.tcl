proc process {inport outport msgname count} {

    array set msgin {}
    port_read $inport $msgname msgin 

    if {$count == 0} {
        foreach idx [array names msgin] {
            puts $msgin($idx)
        }
    }

    port_write $outport $msgname msgin
    return
}
