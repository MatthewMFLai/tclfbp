namespace eval gutenberg {

variable g_url_templates
variable g_regexps

proc init {url_templates regexps} {
    variable g_url_templates
    variable g_regexps

    set g_url_templates $url_templates
    set g_regexps $regexps

    return
}

proc doit {title url_templates regexps p_data} {
    upvar $p_data web_data

    # Extract booklink.

    set url_template [lindex $url_templates 0]
    set url_template2 [lindex $url_templates 1]

    set title [join $title "+"]
    regsub "XXX" $url_template $title url

    if {[catch {Url::get_no_retry $url} data]} {
        set web_data(urlerror) "$title FAIL url error"
	return
    } else {
	set exp [lindex $regexps 0]
	regexp $exp $data -> booklink
	if {![info exists booklink]} {
            set web_data(urlerror) "booklink not foundr"
	    return
	}
    }		

    # Wait for 30 seconds...
    #puts "wait for 5 seconds..."
    after 5000

    # Extract UTF-8 link.

    set url $url_template2$booklink

    if {[catch {Url::get_no_retry $url} data]} {
        set web_data(urlerror) "$title FAIL url error"
	return
    } else {
	set exp [lindex $regexps 1]
	regexp $exp $data -> utf8link 
	if {![info exists utf8link]} {
            set web_data(urlerror) "UFT-8 link not foundr"
	    return
	}
    }

    # Wait for 5 seconds...
    #puts "wait for 5 seconds..."
    after 5000

    # Extract story.

    set url $url_template2$utf8link

    if {[catch {Url::get_no_retry $url} data]} {
        set web_data(urlerror) "$title FAIL url error"
	return
    } else {
	set exp [lindex $regexps 2]
	regexp $exp $data -> cachelink 
	if {![info exists cachelink]} {
	    # Find non-cached content. Return now.
	    set web_data(content) $data
	    return
	}
    }
    
    # Wait for 5 seconds...
    #puts "wait for 5 seconds..."
    after 5000

    # Extract cached story.

    set url $cachelink

    if {[catch {Url::get_no_retry $url} data]} {
        set web_data(urlerror) "$title FAIL url error"
	return
    } else {
	set web_data(content) $data
	return
    }
    return
}

proc extract_data {title p_data} {
    variable g_url_templates
    variable g_regexps
    upvar $p_data data

    array set web_data {}
    set web_data(title) $title
    doit $title $g_url_templates $g_regexps web_data
    if {[info exists web_data(urlerror)] == 0} {
	array set data [array get web_data]
	set data(urlerror) ""
    } else {
	set data(urlerror) $web_data(urlerror)
    }
    return
}

}
