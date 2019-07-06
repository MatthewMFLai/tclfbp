proc process {count} {

    array set msgin {}
    port_read IN-1 msgin 

    array set data {}
    set exchange $msgin(exchange)
    set symbol $msgin(symbol)
    Company_Test_Wrapper::Runit $exchange $symbol data

    array set outdata {}
    port_factory_msg OUT-1 outdata
    foreach idx [array names outdata] {
        if {[info exists data($idx)]} {
            set outdata($idx) $data($idx)
        }
    }
    port_write OUT-1 outdata 
    return
}

proc app_test {} {
    return
}

proc app_init {} {
    global env

    uplevel #0 {source $env(WEB_DRIVER_HOME)/common/common_test_wrapper.tcl}
    uplevel #0 {source $env(WEB_DRIVER_HOME)/company/company_test_wrapper.tcl}
    Common_Test_Wrapper::Init
    Company_Test_Wrapper::Init

    return "OK"
}
