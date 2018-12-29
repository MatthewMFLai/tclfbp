#!/bin/sh 
# \
exec tclsh $0 $@
   # This is client.tcl.

    # Invoke as "client.tcl <filename>" (for a local file).

    set service_port 8000 
    set service_host 192.168.0.115 ;# Old web site - need to change!
    #set service_host localhost ;# Old web site - need to change!

    proc send_one_file name {
        set size [file size $name]
        set fp [open $name r]
        fconfigure $fp -translation binary

        set channel [socket $::service_host $::service_port]
        fconfigure $channel -translation binary
        puts $channel [list $name $size]

        fcopy $fp $channel -size $size

        close $fp
        close $channel
    }

    send_one_file $argv

    exit 0
