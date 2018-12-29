proc loadit {crawler} {
    global env

    source $env(WEB_DRIVER)/$crawler/$crawler.tcl
    return
}

source $env(FSM_HOME)/fsm.tcl
source $env(PATTERN_HOME)/geturl.tcl
source $env(WEB_DRIVER)/financials/financials_fsm.tcl
source $env(WEB_DRIVER)/financials/company_fsm.tcl
source $env(WEB_DRIVER)/financials/symbol_filter.tcl

source $env(WEB_DRIVER)/fundamental/fundamental_fsm.tcl

source $env(WEB_DRIVER)/dividend/dividend_fsm.tcl

source $env(WEB_DRIVER)/options/options_fsm.tcl

source $env(WEB_DRIVER)/optionlist/optionlist_fsm.tcl

source $env(WEB_DRIVER)/symbolpage/symbolpage_fsm.tcl

source $env(WEB_DRIVER)/table/table_fsm.tcl

Url::init
Fsm::Init

Fsm::Load_Fsm $env(WEB_DRIVER)/financials/financials_fsm.dat
Fsm::Init_Fsm financials_fsm
Fsm::Set_State financials_fsm FIND_FINANCIALS

Fsm::Load_Fsm $env(WEB_DRIVER)/financials/company_fsm.dat
Fsm::Init_Fsm company_fsm
Fsm::Set_State company_fsm FIND_COMPANY

Fsm::Load_Fsm $env(WEB_DRIVER)/fundamental/fundamental_fsm.dat
Fsm::Init_Fsm fundamental_fsm
Fsm::Set_State fundamental_fsm FIND_CHANGE

Fsm::Load_Fsm $env(WEB_DRIVER)/dividend/dividend_fsm.dat
Fsm::Init_Fsm dividend_fsm
Fsm::Set_State dividend_fsm FIND_DIVIDEND

Fsm::Load_Fsm $env(WEB_DRIVER)/options/options_fsm.dat
Fsm::Init_Fsm options_fsm
Fsm::Set_State options_fsm FIND_CALLPUT

Fsm::Load_Fsm $env(WEB_DRIVER)/optionlist/optionlist_fsm.dat
Fsm::Init_Fsm optionlist_fsm
Fsm::Set_State optionlist_fsm FIND_TABLE

Fsm::Load_Fsm $env(WEB_DRIVER)/symbolpage/symbolpage_fsm.dat
Fsm::Init_Fsm symbolpage_fsm
Fsm::Set_State symbolpage_fsm FIND_PAGE

Fsm::Load_Fsm $env(WEB_DRIVER)/table/table_fsm.dat
Fsm::Init_Fsm table_fsm
Fsm::Set_State table_fsm FIND_TABLE
package require htmlparse
