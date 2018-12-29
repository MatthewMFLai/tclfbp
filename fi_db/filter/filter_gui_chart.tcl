namespace eval Chart_db {

variable m_path_db
variable m_cache

proc Init {gif_dir_list} {
    variable m_path_db
    variable m_cache
     
    set rc ""
    array set m_path_db {}
    array set m_cache {}
    foreach gifdir $gif_dir_list {
	if {[catch {glob $gifdir/*.gif} tmplist]} {
	    # Probably no gif files in the dir.
	    continue
	}
	foreach filename $tmplist {
	    # Extract symbol name.
	    set idx [string last "/" $filename]
	    incr idx
	    set idx2 [string first ".gif" $filename $idx]
	    incr idx2 -1
	    set symbol [string range $filename $idx $idx2]
	    if {[info exists m_path_db($symbol]} {
		puts "Chart_db::Init duplicate $symbol found!"
		continue
	    }
	    set m_path_db($symbol) $filename
	}
    }
    if {[array names m_path_db] == ""} {
	set rc "No symbols found!"
    }
    return $rc 
}

proc Load_Img {symbol} {
    variable m_path_db
    variable m_cache

    if {![info exists m_path_db($symbol)]} {
	return "ERROR: $symbol data file not found."
    }
    if {![info exists m_cache($symbol)]} {
	if {[catch {image create photo -file $m_path_db($symbol)} rc]} {
	    puts "Chart_db ERROR $rc"
	    return $rc
	}
	set m_cache($symbol) $rc
    }
    return "" 
}

proc Get_Img {symbol} {
    variable m_cache

    if {![info exists m_cache($symbol)]} {
	return ""
    }
    return $m_cache($symbol)
}

proc Delete_Img {symbol} {
    variable m_path_db
    variable m_cache

}

proc Delete_All {} {
    variable m_path_db
    variable m_cache

    set symbollist [array names m_cache]
    foreach symbol $symbollist {
	Delete_Img $symbol
    }
    return ""
}

}
