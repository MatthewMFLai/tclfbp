proc newscale {w title variable from to {is_float INTEGER}} {
    #define this proc first to prevent interpreter error
    if {$is_float == "ISFLOAT"} {
    proc _[set w].ent {val} {
        return [expr {[string is double $val] || [string match {[-+]} $val]} ]
    }
    } else {
    proc _[set w].ent {val} {
        return [expr {[string is integer $val] || [string match {[-+]} $val]} ]
    }
    }
    #create widget holder
    frame $w -borderwidth 2 -relief ridge -height 10
    label $w.lab -text $title -anchor w
    pack $w.lab -side left
    #alternative kb entry method
    entry $w.ent -textvariable $variable -validate all -vcmd "_$w.ent %P"
    #interactive slider with value
    frame $w.fr2 
    label $w.fr2.lab -textvariable $variable -anchor w -width 10
    pack $w.fr2.lab -side left
    scale $w.fr2.sc -orient horizontal -borderwidth 1 \
            -showvalue 0 -length 100 \
            -width 8 -sliderlength 10 \
            -from $from -to $to
    if {$is_float == "ISFLOAT"} {
	$w.fr2.sc configure -resolution 0.01
    }
    $w.fr2.sc configure -variable $variable
    pack $w.fr2.sc -side left 
    pack $w.fr2 -side left
    #bindings
    bind $w.lab <Double-Button-1> {
        if {[winfo ismapped [winfo parent %W].fr2.sc] } {
            [winfo parent %W].ent delete 0 end
            [winfo parent %W].ent insert 0 [[winfo parent %W].fr2.lab cget -text ]
            pack [winfo parent %W].ent
            focus [winfo parent %W].ent
            pack forget [winfo parent %W].fr2
        } else  {
            #set global variable value
            pack [winfo parent %W].fr2
            pack forget [winfo parent %W].ent -fill x
        }
    }
    bind $w.ent <Return> {
        pack forget %W
        pack [winfo parent %W].fr2  
    }
 }
 proc demo {} { 
    set w .fr1
    set ::v(1) 1000000 
    set ::v(2) 0
    set ::v(3) 7.50 
    set ::v(4) 1.00
    newscale .sc1 {Range1: } ::v(1) 0 9000000000
    newscale .sc2 {Range2: } ::v(2) -100 100
    newscale .sc3 {P/E:    } ::v(3) 0.00 20.00 ISFLOAT
    newscale .sc4 {P/B:    } ::v(4) 0.00 50.00 ISFLOAT
    pack .sc1 .sc2 .sc3 .sc4 -side top
 }
 #demo

