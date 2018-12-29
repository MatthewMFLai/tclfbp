proc get_word {} {
    global g_wordlist
    global g_count
    global .msg

    if {$g_wordlist == ""} {
    	.msg configure -text "Finish"
	return
    }
    set word [lindex $g_wordlist 0]
    set g_wordlist [lreplace $g_wordlist 0 0]
    set remain [llength $g_wordlist]
    .msg configure -text "Word: $word Remain: $remain"
    set p_ip [ip::source]
    byRetry::init $p_ip
    byRetry::set_retry $p_ip 0
    byList::init $p_ip
    byList::set_list $p_ip [list $word] 
    byList::set_crawler $p_ip "freedict" 
    server_send $p_ip OUT-1
    ip::sink $p_ip

    incr g_count
    return
}

proc process {inport p_ip} {
    set rc ""
    get_word
    return $rc
}

proc init {datalist} {
    global g_wordlist
    global g_count

    set g_count 0
    set g_wordlist ""
    set vocabfile [lindex $datalist 0]
    set fd [open $vocabfile r]
    # Ignore first line.
    gets $fd word
    while {[gets $fd word] > -1} {
	if {[string first "count =" $word] > -1} {
	    continue
	}
    	lappend g_wordlist $word
    }
    close $fd
    return
}

proc kicker {datalist} {
    get_word
}

proc shutdown {} {
}

source $env(COMP_HOME)/ip2/byList.tcl
source $env(COMP_HOME)/ip2/byRetry.tcl

package require Tk
button .msg -text OK
pack .msg

#------------------------------

#source $env(WEB_DRIVER)/loadall/loadall.tcl
