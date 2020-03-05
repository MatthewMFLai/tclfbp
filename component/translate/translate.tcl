proc process {} {

    array set msgin {}
    port_read IN-1 msgin 

	if {$msgin(crawler) == "stub"} {
		port_write OUT-1 msgin
		return
	}

    array set data {}
    set symbol $msgin(symbol)
    Translate_Test_Wrapper::Runit $symbol data
	set msgin(meanings) $data(meanings)
    port_write OUT-1 msgin 
    return
}

proc app_test {} {
    return
}

proc app_init {} {
    global env

    uplevel #0 {source $env(WEB_DRIVER_HOME)/common/common_test_wrapper.tcl}
    uplevel #0 {source $env(WEB_DRIVER_HOME)/translate/translate_test_wrapper.tcl}
    Common_Test_Wrapper::Init
    Translate_Test_Wrapper::Init

    return "OK"
}

package require htmlparse
