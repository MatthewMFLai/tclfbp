proc process {inport p_ip} {
    global g_wordlist

    set rc ""
    set word [lindex [byList::get_list $p_ip] 0]
    if {[lsearch $g_wordlist $word] ==-1} {
	lappend g_wordlist $word  
    	server_send $p_ip OUT-1
    } else {
    	server_send $p_ip OUT-2
    }
    return $rc
}

proc init {datalist} {
    variable g_wordlist

    set g_wordlist ""
    return
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
