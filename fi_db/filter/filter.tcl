proc run_filter {filename} {
    set fd [open $filename r]
    set rc ""
    set cnt 0
    while {[gets $fd line] > -1} {
	set line [string trim $line]
	if {[string first "#" $line] == 0} {
	    continue
	}

	set cmd Fi_db::Get_Company_by_[lindex $line 0]
	if {[lindex $line end] == "||"} {
	    set data [lrange $line 1 end-1]
	    set operate "lunion"
	} else {
	    set data [lrange $line 1 end]
	    set operate "lintersect"
	} 
	puts "$cmd $data"
	set result [eval $cmd $data]
	if {$cnt} {
	    set rc [$operate $rc $result]
	} else {
	    set rc $result
	}
	incr cnt
	puts "count: [llength $rc]"
	if {[llength $rc] == 0} {
	    break
	} 
    }
    close $fd
    return $rc
}

proc run_filter_live {line} {
    set line [string trim $line]
    set cmd Fi_db::Get_Company_by_[lindex $line 0]
    set data [lrange $line 1 end]
    puts "$cmd $data"
    set result [eval $cmd $data]
    return $result
}
