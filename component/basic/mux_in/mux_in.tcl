proc display {msg} {
    global g_display
    if {$g_display == "ON"} {
	global .msg
    	.msg configure -text $msg 
    }
    return
}


proc process {inport p_ip} {
    global g_server_id

    set server_id $g_server_id 
    # Insert the inport data into the request data.
    byMux::add_key $p_ip $server_id $inport	
    server_send $p_ip OUT-0
    display "Mux data from in port $inport"
}

proc init {datalist} {
    global g_display
    global g_server_id
    set g_display [lindex $datalist 0]
    set g_server_id [lindex $datalist 1]
    if {$g_display == ""} {
	set g_display "ON"
	package require Tk
	global .msg
	button .msg -text OK
	pack .msg
    }
    return
}

proc shutdown {} {
}

# Need to source in other tcl scripts in the same directory.
# The following trick to retrieve the current subdirectory
# should work.
#set scriptname [info script]
#regsub "mux.tcl" $scriptname "ZZZ" scriptname
#regsub "ZZZ" $scriptname "byMux.tcl" script2 
#source $script2 
source $env(COMP_HOME)/ip/byMux.tcl
set g_display "ON" 
if {0} {
package require Tk
button .msg -text OK
pack .msg
}
