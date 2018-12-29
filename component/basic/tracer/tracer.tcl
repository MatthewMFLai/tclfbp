proc process {inport p_ip} {
    global g_freeze

    set data [ip::serialize $p_ip]
  
    global .msg
    .msg insert end $data\n
    server_send $p_ip OUT-1
    if {$g_freeze == 0} {
    	.msg see end
    }
}

proc init {datalist} {
}

proc shutdown {} {
}

global g_freeze
set g_freeze 0

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
