# Given a potential index list and a string description,
# find the tokens in the index that is present inside the string.
# Return the list of tokens.
# Example
# index list = {test match {lar exp} xyz}
# desc = {This is a test for regular expression match.}
# returned list = {test {lar exp} match}

proc gen_index {indexlist desc} {
    set rc ""
    set matched 1

    # Generate initial regexp pattern.
    set matchpattern ""
    foreach token $indexlist {
	append matchpattern $token
	append matchpattern "|"
    }
    set matchpattern [string range $matchpattern 0 end-1]

    set idx 0
    while {$matched} {
	# Generate regexp pattern.
	set matched [regexp -nocase -indices -start $idx $matchpattern $desc idxpair]
	if {$matched == 0} {
	    continue
	}	
	set index_matched [string range $desc [lindex $idxpair 0] [lindex $idxpair 1]]
	lappend rc [string tolower $index_matched]
	set idx [expr [lindex $idxpair 1] + 1]
    }
    set rc [lsort -unique $rc]

    # The matched index may be in upper case while the passed in index
    # list is in lower case. Need to return the exact index back.
    set result ""
    foreach token $rc {
	foreach index $indexlist {
	    if {[string match -nocase $token $index] == 0} {
		continue
	    }
	    lappend result $index
	    break
	}
    }	
    return $result
}
