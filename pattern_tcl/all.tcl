#!/bin/sh
# \
exec tclsh $0 $@

package require tcltest
namespace import ::tcltest::*

configure -testdir \
    [file dirname [file normalize [info script]]]
#configure -verbose bpte
configure -singleproc 0
eval configure $argv

runAllTests
