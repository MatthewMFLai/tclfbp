proc process {count} {
    global g_msgcount

    array set msgin {}
    port_read IN-1 msgin 
    incr g_msgcount

    if {$count == 0} {
        foreach idx [array names msgin] {
            #puts $msgin($idx)
        }
    }

    port_write OUT-1 msgin
    return
}

proc app_test {} {
    global g_msgcount

    return $g_msgcount
}

proc app_init {} {
    global g_msgcount

    set g_msgcount 0
    return "OK"
}
