proc process {} {
	global g_freeze
	global .msg

    array set msgin {}
	port_read IN-1 msgin
    .msg insert end [array get msgin]\n
    if {$g_freeze == 0} {
    	.msg see end
    }
    port_write OUT-1 msgin
    return
}

proc app_test {} {
    return
}

proc app_init {} {
	global g_freeze

	set g_freeze 0
    return "OK"
}

package require Tk
button .button -text Clear -command {
    .msg delete 1.0 end
}
button .button2 -text F -command {
    global g_freeze
    if {$g_freeze} {
		set g_freeze 0
    } else {
		set g_freeze 1
    }
}

text .msg -width 40 -height 5 -wrap none \
    -xscrollcommand {.xsbar set} \
    -yscrollcommand {.ysbar set}
scrollbar .xsbar -orient horizontal -command {.msg xview}
scrollbar .ysbar -orient vertical -command {.msg yview}
grid .button .button2 -sticky nsew
grid .msg .ysbar -sticky nsew
grid .xsbar -sticky nsew
grid columnconfigure . 0 -weight 1
grid rowconfigure . 0 -weight 1
