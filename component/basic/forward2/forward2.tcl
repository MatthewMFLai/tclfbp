proc process {inport p_ip} {
    global g_outportlist
    global g_listlen
   
    regsub "IN-" $inport "OUT-" not_port
    set idx [lsearch $g_outportlist $not_port]
    set outportlist [lreplace $g_outportlist $idx $idx]
 
    # Extract the ball colour information.
    set data [byBall::get_msg $p_ip]
    global .msg
    .msg configure -text $data -foreground $data -background black
    update
    after 500
    #after [expr int(rand() * 1000)]
    .msg configure -text "yellow" -background black -foreground black
    set outport [lindex $outportlist [expr int(rand() * 100) % $g_listlen]]
    #set p_ip [ip::source]
    #byBall::init $p_ip
    #byBall::set_msg $p_ip $data
    server_send $p_ip $outport
}

proc init {datalist} {
    global g_outportlist
    global g_listlen

    set g_outportlist [get_outports]
    set g_listlen [expr [llength $g_outportlist] - 1]
    set name [lindex $datalist 0]
    if {$name != ""} {
	wm title . $name
    }
    return
}

proc kicker {datalist} {
    foreach msg $datalist {
    	set p_ip [ip::source]
    	byBall::init $p_ip
    	byBall::set_msg $p_ip $msg 
    	server_send $p_ip OUT-E
    }
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip/byBall.tcl

package require Tk
button .msg -text "yellow" -background black -foreground black

pack .msg
