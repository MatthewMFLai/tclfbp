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
    # Search for the out port in the request data
    # and forward the data to out port. Remove out port
    # data from the request.
    set outport [byMux::get_key $p_ip $server_id]
    if {$outport != ""} {    
    	regsub "IN" $outport "OUT" outport
    	byMux::remove_key $p_ip $server_id 
    	server_send $p_ip $outport	
    	display "Demux data to out port $outport"
    } else {
    	display "Demux data information missing"
    }
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
