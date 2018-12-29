#!/bin/sh
# \
exec tclsh $0 "$@"
source $env(PATTERN_HOME)/geturl.tcl
source $env(WEB_DRIVER_HOME)/gutenberg/gutenberg.tcl

proc init_template {} {
    global env

    set templatefile $env(WEB_DRIVER_HOME)/gutenberg/url.template
    set url_templates ""
    set regexps ""

    set fd [open $templatefile "r"]
    gets $fd line
    lappend url_templates $line
    gets $fd line
    lappend url_templates $line
    gets $fd line
    lappend regexps $line
    gets $fd line
    lappend regexps $line
    gets $fd line
    lappend regexps $line
    close $fd

    gutenberg::init $url_templates $regexps
    return
}

###########################################################
# GUI code
###########################################################

  frame  .f1     ;# Frame for button
  frame  .f2     ;# Frame for input
  frame  .f3     ;# Frame for output

  label  .labA -text "Title"
 
  entry  .entA -textvar A -width 50 
 
  button .get -text "GET" -command {
    if {$A != ""} {
	array set tmpdata {}
	gutenberg::extract_data $A tmpdata
	if {[info exists tmpdata(content)]} {
	    .f3.text delete 0.0 end
	    .f3.text insert end $tmpdata(content)
	}
    }
  }
 
  button .open -text "OPEN" -command {
    set filename [tk_getOpenFile]
    if {$filename != ""} {
	set fd [open $filename r]
	set data [read $fd]
	close $fd
	.f3.text delete 0.0 end
	.f3.text insert end $data
    }
  }

  button .save -text "SAVE" -command {
    set filename [tk_getSaveFile]
    if {$filename != ""} {
	set fd [open $filename w]
	puts $fd [.f3.text get 0.0 end]
	close $fd
    }
  }
 
  button .exit -text "EXIT" -command {
    exit 0
  }

  pack   .f1 .f2 .f3

  pack   .get         -in .f1  -side left
  pack   .open        -in .f1  -side left
  pack   .save        -in .f1  -side left
  pack   .exit        -in .f1  -side left
  pack   .labA .entA  -in .f2  -side left

scrollbar .f3.scroll -command ".f3.text yview"
text .f3.text -yscroll ".f3.scroll set" \
	-height 40 -width 100 -setgrid 1
pack .f3.text .f3.scroll -side left -fill y -expand 1


###########################################################
# Framework proceudres
###########################################################

Url::init
init_template
