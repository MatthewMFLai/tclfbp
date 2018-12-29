# DYNAMIC SOURCE BEGIN
foreach filename [glob $env(CONTENT_HOME)/gencode/simple/*.tcl] {
    source $filename
}
# DYNAMIC SOURCE END
# DYNAMIC SOURCE BEGIN
foreach filename [glob $env(CONTENT_HOME)/gencode/complex/*.tcl] {
    source $filename
}
# DYNAMIC SOURCE END
# DYNAMIC SOURCE BEGIN
foreach filename [glob $env(CONTENT_HOME)/gencode/dynamic_type/*.tcl] {
    source $filename
}
# DYNAMIC SOURCE END

namespace eval Content {

    variable m_content
    variable m_debug

proc get_stop {paragraph} {

    set idxlist ""
    set idx [string first "." $paragraph]
    if {$idx > -1} {
	lappend idxlist $idx
    } 
    set idx [string first "!" $paragraph]
    if {$idx > -1} {
	lappend idxlist $idx
    } 
    set idx [string first "?" $paragraph]
    if {$idx > -1} {
	lappend idxlist $idx
    }
    set idxlist [lsort -integer $idxlist]

    if {$idxlist != ""} {
	set idx [lindex $idxlist 0]

	# To handle case like "abc !"
	incr idx
	if {[string index $paragraph $idx] != "\""} {
	    incr idx -1
	}
    } else {
	set idx -1
    }
    return $idx  
}

proc misc_filter {sentence} {
    set sentence [string tolower $sentence]
    regsub -all "," $sentence "" sentence
    regsub -all "_" $sentence " " sentence
    regsub -all {\.} $sentence "" sentence
    regsub -all {\?} $sentence " " sentence
    regsub -all "!" $sentence " " sentence
    return $sentence
}

proc get_sentences {paragraph} {
    set rc ""

    set idx [get_stop $paragraph]
    while {$idx > -1} {
	lappend rc [string trim [string range $paragraph 0 $idx]]
	incr idx
	set paragraph [string range $paragraph $idx end]
  	set idx [get_stop $paragraph]
    }
    return $rc  
}

proc get_words {sentence} {
    set rc ""

    set sentence [string trim $sentence]
    regsub -all "\"" $sentence "" sentence 
    foreach word $sentence {
	if {[string is alpha $word]} {
	    append rc "$word "
	} else {
	    # Check each character and eliminate the non-alphabets.
	    set newword ""
	    foreach char [split $word ""] {
	    	if {[string is alpha $char]} {
		    append newword $char
		}
	    }
	    append rc "$newword "
	} 
    }
    return [string trim $rc] 
}

proc fetch_word {word} {
    variable m_content

    set p_word [byAllWords::get_part $m_content $word]
    if {![Assert::Check $p_word]} {
	set p_word [malloc::getmem]
	Assert::Assert $p_word
	init_Word $p_word
	byText::set_text $p_word $word
	byAllWords::set_key $p_word $word
	byAllWords::add_part $m_content $p_word
    }
    return $p_word	 
}
  
# The marker must have the format of 
# <WORD> <NUL> <NUL> ... <WORD> ...
# We also need to handle these special cases:
# 1. Just one <WORD>
#    In this case no concordance data is created.
# 2. No <WORD>
#    In this case no concordance data is created.
# 3. Sentence starts with <NUL>
#    The dummy ZZBEGIN word is prefixed to the sentence.
# 4. Sentence ends with <NUL>
#    The dummy ZZEND word is suffixed to the sentence.
# 5. Sentence has contiguous <WORD> <WORD> pattern
#    The dummy ZZSEP is inserted between the recognized words.

proc preprocess_sentence {p_sentence p_marker} {
    upvar $p_sentence sentence
    upvar $p_marker marker

    set new_sentence ""
    set new_marker ""

    if {[lindex $marker 0] == "NUL"} {
	lappend new_sentence "ZZBEGIN"
	lappend new_marker "WORD"
    } else {
    	lappend new_sentence [lindex $sentence 0] 
    	lappend new_marker [lindex $marker 0]
	set sentence [lrange $sentence 1 end]
	set marker [lrange $marker 1 end]
    }

    set prev_mark "WORD"
    foreach word $sentence mark $marker {
	if {$mark == $prev_mark &&
	    $mark == "WORD"} {
	    lappend new_sentence "ZZSEP"
	    lappend new_marker "NUL"    
	}
	lappend new_sentence $word
	lappend new_marker $mark
	set prev_mark $mark	
    }

    if {[lindex $marker end] == "NUL"} {
	lappend new_sentence "ZZEND"
	lappend new_marker "WORD"
    }

    set sentence $new_sentence
    set marker $new_marker
    return
}
 
proc Add_Concordance {title line marker nodeaddr} {
    variable m_content

    if {[llength $line] == 1} {
	return
    }

    set p_title [byTitle::get_part $m_content $title]
    Assert::Assert $p_title
    set p_parent [byTokens::get_node $p_title $nodeaddr]
    Assert::Assert $p_parent

    preprocess_sentence line marker
    #puts $line
    #puts $marker

    # Important to stop at length - 1.
    # WORD NUL WORD
    # The last WORD should not start another cycle!
    set len [llength $line]
    incr len -1

    set idx 0
    while {$idx < $len} {
	set p_word_begin [fetch_word [lindex $line $idx]]
	set val_begin [lindex $line $idx]
	incr idx
	set idx_start $idx
	while {[lindex $marker $idx] == "NUL"} {
	    incr idx
	}
	set p_word_end [fetch_word [lindex $line $idx]]
	set val_end [lindex $line $idx]
	incr idx -1
	set connect [lrange $line $idx_start $idx]
	set val_connect $connect

	set p_connect [malloc::getmem]
	Assert::Assert $p_connect
	init_Connect $p_connect
	byText::set_text $p_connect $connect
    	byTokens::add_node $p_parent $p_connect

	byConnect::graph_add_edge $p_word_begin $p_word_end $p_connect

        #puts "$val_begin - $val_connect - $val_end"

        # Repeat cycle with the end word.
	incr idx 1 
    } 
    return
}

proc Add_Token {title text level} {
    variable m_content

    set p_title [byTitle::get_part $m_content $title]
    Assert::Assert $p_title

    set p_parent $p_title
    if {$level > 1} {
	incr level -1
    	set p_parent [byTokens::get_end_node $p_title $level]
	Assert::Assert $p_parent
    }
    set p_token [malloc::getmem]
    init_Token $p_token
    byText::set_text $p_token $text
    byTokens::add_node $p_parent $p_token
    return [byTokens::get_node_addr $p_token]
}

proc Get_All_Title {} {
    variable m_content

    set rc ""
    foreach p_title [byTitle::get_iterator $m_content] {
    	Assert::Assert $p_title
	lappend rc [byText::get_text $p_title]
    }
    return $rc
}

proc Get_All_Token {title depth} {
    variable m_content

    set rc ""
    set p_title [byTitle::get_part $m_content $title]
    if {![Assert::Check $p_title]} {
	return $rc
    }

    set level_prev 0 
    set line ""
    foreach pair [byTokens::traverse_depth_first $p_title 0] {
	set p_token [lindex $pair 0]
	set level [lindex $pair 1]
	if {$level < [expr $depth + 1]} {
	    set data [byText::get_text $p_token]
	    if {$level_prev == $level} {
		append line " $data"
		continue
	    }
	    set line [string trim $line]
	    if {[string length $line]} {
	    	lappend rc $line
	    }
	    set line $data
	    set level_prev $level
	}
    }
    if {$line != ""} {
	lappend rc $line
    }
    return $rc
}

proc Get_Token_Under_Addr {title depth nodeaddr} {
    variable m_content

    set rc ""
    set p_title [byTitle::get_part $m_content $title]
    if {![Assert::Check $p_title]} {
	return $rc
    }

    set level_prev 0 
    set line ""
    foreach pair [byTokens::traverse_depth_first $p_title 0] {
	set p_token [lindex $pair 0]
	Assert::Assert $p_token
	if {![byTokens::is_under $p_token $nodeaddr]} {
	    continue
	}
	set level [lindex $pair 1]
	if {$level < [expr $depth + 1]} {
	    set data [byText::get_text $p_token]
	    if {$level_prev == $level} {
		append line " $data"
		continue
	    }
	    set line [string trim $line]
	    if {[string length $line]} {
	    	lappend rc $line
	    }
	    set line $data
	    set level_prev $level
	}
    }
    if {$line != ""} {
	lappend rc $line
    }
    return $rc
}

proc Get_Token_At_Level {title depth} {
    variable m_content

    set rc ""
    set p_title [byTitle::get_part $m_content $title]
    if {![Assert::Check $p_title]} {
	return $rc
    }

    set req_level [expr $depth - 1]
    foreach pair [byTokens::traverse_depth_first $p_title 0] {
	set p_token [lindex $pair 0]
	Assert::Assert $p_token
	set level [lindex $pair 1]
	if {$level == $req_level} {
	    set data [byText::get_text $p_token]
	    set data [string trim $data]
	    if {[string length $data]} {
    	    	set addr [byTokens::get_node_addr $p_token]
	    	lappend rc [list $data $addr]
	    }
	}
    }
    return $rc
}

proc Get_Concordance {title depth nodeaddr} {
    variable m_content

    set rc ""
    set p_title [byTitle::get_part $m_content $title]
    if {![Assert::Check $p_title]} {
	return $rc
    }
    foreach pair [byTokens::traverse_depth_first $p_title 0] {
	set p_token [lindex $pair 0]
	Assert::Assert $p_token
	if {![byTokens::is_under $p_token $nodeaddr]} {
	    continue
	}

	set level [lindex $pair 1]
	if {$level != [expr $depth + 1]} {
	    continue
	}
	set p_vertex [byConnect::graph_get_vertex_from $p_token]
	Assert::Assert $p_vertex
	lappend rc [byText::get_text $p_vertex]
	set p_vertex [byConnect::graph_get_vertex_to $p_token]
	Assert::Assert $p_vertex
	lappend rc [byText::get_text $p_vertex]
    }

    set rc [lsort -unique $rc]
    set idx [lsearch $rc "ZZBEGIN"]
    if {$idx != -1} {
	set rc [lreplace $rc $idx $idx]
    }
    set idx [lsearch $rc "ZZEND"]
    if {$idx != -1} {
	set rc [lreplace $rc $idx $idx]
    }
    return $rc
}

proc get_title {p_token} {
    while {[Assert::Check $p_token]} {
	set p_prev_token $p_token
	set p_token [byTokens::get_parent $p_token]
    }	
    return $p_prev_token
}

proc Get_In_Sentence {word p_data} {
    upvar $p_data data
    variable m_content

    set p_vertex [byAllWords::get_part $m_content $word]
    if {![Assert::Check $p_vertex]} {
	return
    }

    set tmplist ""
    foreach p_edge [byConnect::graph_get_from_iterator $p_vertex] {
	Assert::Assert $p_edge
	set p_parent [byTokens::get_parent $p_edge]
	Assert::Assert $p_parent
	lappend tmplist $p_parent
    }
    foreach p_edge [byConnect::graph_get_to_iterator $p_vertex] {
	Assert::Assert $p_edge
	set p_parent [byTokens::get_parent $p_edge]
	Assert::Assert $p_parent
	if {[lsearch $tmplist $p_parent] == -1} {
	    lappend tmplist $p_parent
	}
    }
    foreach p_parent $tmplist {
	set p_title [get_title $p_parent]
	Assert::Assert $p_title
	set title [byText::get_text $p_title]
	if {![info exists data($title)]} {
	    set data($title) ""
	}
	lappend data($title) [byText::get_text $p_parent]
    }

    return
}

proc Add_Title_Author {title author} {
    variable m_content

    set p_title [byTitle::get_part $m_content $title]
    if {![Assert::Check $p_title]} {
    	set p_author [byAuthor::get_part $m_content $author]
	if {![Assert::Check $p_author]} {
	    set p_author [malloc::getmem]
	    Assert::Assert $p_author
	    init_Author $p_author
	    byText::set_text $p_author $author
	    byAuthor::set_key $p_author $author
	    byAuthor::add_part $m_content $p_author
	}

	set p_title [malloc::getmem]
	Assert::Assert $p_title
	init_Title $p_title
	byText::set_text $p_title $title
	byTitle::set_key $p_title $title
	byTitle::add_part $m_content $p_title

	byAuthor_Title::set_key $p_title $title
	byAuthor_Title::add_part $p_author $p_title
    }
    return
}
  
proc Add_Paragraph {line depth title} {

    Add_Token $title "" $depth
    set sentences [get_sentences $line]
    set rc ""
    foreach sentence $sentences {
	set nodeaddr [Add_Token $title $sentence [expr $depth + 1]]
	set sentence [get_words $sentence]
	set sentence [misc_filter $sentence]
	lappend rc [list $sentence $nodeaddr]
    }
    return $rc 
}

proc Add_ContextMeanings {title nodeaddr meanings} {
    variable m_content

    set rc ""
    set p_title [byTitle::get_part $m_content $title]
    if {![Assert::Check $p_title]} {
	set rc "Content: invalid title $title"
	return $rc
    }
    set p_node [byTokens::get_node $p_title $nodeaddr]
    if {![Assert::Check $p_node]} {
	set rc "Content: invalid node address $nodeaddr"
	return $rc
    }

    set p_obj [byLocalMeaning::get_part $p_title $nodeaddr]
    if {[Assert::Check $p_obj]} {
	# Update context meaning.
	byText::set_text $p_obj $meanings
    } else {
    	set p_obj [malloc::getmem]
    	Assert::Assert $p_obj
    	init_ContextMean $p_obj
    	byText::set_text $p_obj $meanings
    	byLocalMeaning::set_key $p_obj $nodeaddr
    	byLocalMeaning::add_part $p_title $p_obj
    }
    return $rc
}

proc Get_ContextMeanings {title nodeaddr} {
    variable m_content

    set rc ""
    set p_title [byTitle::get_part $m_content $title]
    if {![Assert::Check $p_title]} {
	set rc "Content: invalid title $title"
	return $rc
    }
    set p_node [byTokens::get_node $p_title $nodeaddr]
    if {![Assert::Check $p_node]} {
	set rc "Content: invalid node address $nodeaddr"
	return $rc
    }

    set p_obj [byLocalMeaning::get_part $p_title $nodeaddr]
    if {[Assert::Check $p_obj]} {
	return [byText::get_text $p_obj]
    }
    return $rc
}

proc Init {{debug 0}} {

    variable m_content
    variable m_debug

    # Initiailize the main object first.
    set m_content [malloc::getmem]
    set m_debug $debug
    init_ContentMain $m_content
    return
}

proc Dump {} {
    variable m_content

    return
}

proc Save {filename} {
    variable m_content
    variable m_debug
    malloc::set_var fsm_var $m_content
    malloc::set_var fsm_debug $m_debug
    #malloc::save $filename
}

proc Load {filename} {
    variable m_content
    variable m_debug
    #malloc::restore $filename
    set m_content [malloc::get_var fsm_var]
    set m_debug [malloc::get_var fsm_debug]
}

}
