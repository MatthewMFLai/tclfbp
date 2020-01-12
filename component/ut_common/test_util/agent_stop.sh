ps -al > proc.dat
tclsh $COMP_HOME/2.0/testall/test1/fbp_stop.tcl proc.dat
rm proc.dat
