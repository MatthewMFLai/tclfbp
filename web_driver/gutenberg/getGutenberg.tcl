#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(PATTERN_HOME)/malloc.tcl
source $env(PATTERN_HOME)/geturl.tcl

# sanity mode 0: get real url data, parse with default fsm.
# sanity mode 1: get real url data, parse with custom fsm.
# sanity mode 2: get  url data from file, parse with custom fsm.
set sanity_mode 0
Url::init
 
if {$sanity_mode} {
    malloc::init
}

set infile [lindex $argv 0]
set sanity [lindex $argv 1]

if {$sanity_mode != 2} { 
    set in_fd [open $infile r]
    gets $in_fd url
    close $in_fd
    set data [Url::get_no_retry $url]

    # Custom code...

} else {
    set fd [open raw.dat r]
    set data [read $fd]
    close $fd
    # Custom code...
}

if {$sanity_mode == 0} {
    set fd [open raw.dat w]
    puts $fd $data
    close $fd
}

if {$sanity_mode} {
    #htmlparse::parse -cmd fsm_if $data
    # Retrieve data from gutenberg_fsm...
    # ...
    # ...
    if {$sanity != "test"} {
    	# Display etrieved data...
    	# ...
    	# ...
        #gutenberg_fsm::Dump
    } else {
    	# Check retrieved data and return -1 if data invalid.
    	# ...
    	# ...
	# if ....
	# exit -1
    }
} else {
    set g_fd [open out.dat w]
    #htmlparse::parse -cmd fsm $data
    close $g_fd
}
exit 0
