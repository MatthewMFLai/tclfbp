proc process {count} {

    array set msgin {}
    port_read IN-1 msgin 

    if {$count == 0} {
        foreach idx [array names msgin] {
            puts $msgin($idx)
        }
    }

    port_write OUT-1 msgin
    return
}
