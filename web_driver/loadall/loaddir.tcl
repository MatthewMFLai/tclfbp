source $env(PATTERN_HOME)/sys_util.tcl

proc findfsm {dirname crawler p_data} {
    upvar $p_data data

    # From the files in the given directory, look for xxx_fsm.tcl and
    # xxx_fsm.dat.
    # Also look for $crawler.tcl
    set found_crawler 0
    if {[catch {glob $dirname/$crawler/*} filelist]} {
	return $found_crawler
    }

    set list_tcl ""
    set list_dat ""
    foreach token $filelist {
	if {[file isdir $token]} {
	    continue
	}
	regsub "$dirname/$crawler/" $token "" filename
	if {$filename == "$crawler\.tcl"} {
	    set found_crawler 1
	    continue
	}
	set idx [string first "_fsm.tcl" $filename]
	if {$idx > 0} {
	    incr idx -1
	    lappend list_tcl [string range $filename 0 $idx]
	    continue
	}	
	set idx [string first "_fsm.dat" $filename]
	if {$idx > 0} {
	    incr idx -1
	    lappend list_dat [string range $filename 0 $idx]
	    continue
	}
    }
   
    # In the runtime environment all the tcl module under the
    # WEB_DRIVER directory will be removed, hence the following
    # logic will not work. Thus we need to check for runtime
    # environment first.
    
    if {[UtilSys::Is_Runtime] == 0} { 
    	foreach fsm $list_tcl {
    	    if {[lsearch $list_dat $fsm] != -1} {
    	    	set data($fsm) 1
    	    }
    	}
    } else {
    	foreach fsm $list_dat {
            set data($fsm) 1
	    set found_crawler 1
    	}
    }
    return $found_crawler	
}

proc loadeach {rootdir symbol} {
    set tcl_suffix "_fsm.tcl"
    set dat_suffix "_fsm.dat"
    set fsm_suffix "_fsm"
    set just_tcl_suffix ".tcl"

    array set data {}
    if {![findfsm $rootdir $symbol data]} {
    	return 
    }
# DYNAMIC SOURCE BEGIN
    source $rootdir/$symbol/$symbol$just_tcl_suffix
# DYNAMIC SOURCE END 
    foreach fsm [array names data] {
# DYNAMIC SOURCE BEGIN
    	source $rootdir/$symbol/$fsm$tcl_suffix
# DYNAMIC SOURCE END 
    	Fsm::Load_Fsm $rootdir/$symbol/$fsm$dat_suffix
    	Fsm::Init_Fsm $symbol$fsm_suffix
    }
}

proc loadit {rootdir} {
    global env

    if {[catch {glob $rootdir/*} filelist]} {
	puts "loaddir: $rootdir is empty!"
	return
    }

# DYNAMIC SOURCE BEGIN
    source $env(FSM_HOME)/fsm.tcl
    source $env(PATTERN_HOME)/geturl.tcl
# DYNAMIC SOURCE END 

    foreach dirname $filelist {
	if {[file isdir $dirname] == 0} {
	    continue
	}
	if {[file exists $dirname/ignore]} {
	    continue
	}
	# Extract the symbol name.
	set idx [string last "/" $dirname]
	incr idx
	set symbol [string range $dirname $idx end]
	regsub -all {\.} $symbol "_" symbol
	loadeach $rootdir $symbol
    }
    package require htmlparse
}
