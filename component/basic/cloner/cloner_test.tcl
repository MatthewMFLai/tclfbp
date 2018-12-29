proc process {inport p_ip} {
    global g_rx_ports

    set ball [byBall::get_BALL $p_ip]

    global g_test_socket
    puts $g_test_socket "ball received in port $inport"
    flush $g_test_socket

    set idx [lsearch $g_rx_ports $inport]
    if {$idx > -1} {
	set g_rx_ports [lreplace $g_rx_ports $idx $idx]
    }
    if {$g_rx_ports == ""} {
        puts $g_test_socket "TEST-DRIVER-FINISH"
        flush $g_test_socket
    }
    return
}

proc init {datalist} {
    global g_test_socket
    if {$datalist != ""} {
	set g_test_socket [socket localhost [lindex $datalist 0]]
    }
}

proc kicker {datalist} {
    global g_rx_ports
    set g_rx_ports [get_inports]

    set ball [lindex $datalist 0]
    set p_ip [ip::source]
    byBall::init $p_ip
    byBall::set_BALL $p_ip $ball 
    server_send $p_ip OUT-1
}

proc shutdown {} {
    global g_test_socket
    if {$g_test_socket != ""} {
	close $g_test_socket
	set g_test_socket ""
    }
}

source $env(COMP_HOME)/ip/byBall.tcl
set g_test_socket ""
