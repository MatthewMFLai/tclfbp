#!/bin/sh 
# \
exec tclsh $0 $@
    # This is server.tcl.

    # This is a model implementation of file-copying through Tcl's [socket]
    #    facilities.  What follows is the server process, which receives
    #    files through network connections, and deposits them in
    #    $destination_directory.

    # A production version of this model would probably expose parameters,
    #    handle exceptions more gracefully, consider security, and so on.
    #    The purpose of this code is primarily pedagogic.

        # You might want this to come from a command-line argument,
        #    or environment variable, or even let the clients pass
        #    it in.
    set destination_directory /tmp

        # A command-line argument is probably a good way to specify this.
    set service_port 8000 

    proc receive_file {channel_name client_address client_port} {
        fconfigure $channel_name -translation binary
        gets $channel_name line
        foreach {name size} $line {}

        set fully_qualified_filename [file join $::destination_directory $name]
        set fp [open $fully_qualified_filename w]
        fconfigure $fp -translation binary

        fcopy $channel_name $fp -size $size

        close $channel_name
        close $fp
    }

    socket -server receive_file $service_port

    vwait forever
