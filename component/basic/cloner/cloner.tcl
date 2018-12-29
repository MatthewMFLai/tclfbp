proc process {inport p_ip} {
    foreach outport [get_outports] {
	set p_cloned [ip::clone $p_ip]
	server_send $p_cloned $outport
	ip::sink $p_cloned
    }
    return ""
}

proc init {datalist} {
    return
}

proc shutdown {} {
    return
}

# Need to source in other tcl scripts in the same directory.
# The following trick to retrieve the current subdirectory
# should work.
#set scriptname [info script]
#regsub "selector.tcl" $scriptname "ZZZ" scriptname
#regsub "ZZZ" $scriptname "bySelect.tcl" script2 
#source $script2
