lappend auto_path $env(DISK2)/snit
lappend auto_path $env(DISK2)/pdf4tcl08
package require pdf4tcl
pdf4tcl::new mypdf -paper a4 -margin 15mm
mypdf startPage
mypdf canvas $c
mypdf write -file canvas.pdf

# To use the Img package to generate PNG output format:
# Make sure the canvas is completely exposed ie. not covered at all!
package require Img
set im [image create photo -data $c]
$im write tmp.png -format PNG
