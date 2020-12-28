# Copyright (C) 2016 by Matthew Lai, email : mmlai@sympatico.ca
#
# The author  hereby grants permission to use,  copy, modify, distribute,
# and  license this  software  and its  documentation  for any  purpose,
# provided that  existing copyright notices  are retained in  all copies
# and that  this notice  is included verbatim  in any  distributions. No
# written agreement, license, or royalty  fee is required for any of the
# authorized uses.  Modifications to this software may be copyrighted by
# their authors and need not  follow the licensing terms described here,
# provided that the new terms are clearly indicated on the first page of
# each file where they apply.
#
# IN NO  EVENT SHALL THE AUTHOR  OR DISTRIBUTORS BE LIABLE  TO ANY PARTY
# FOR  DIRECT, INDIRECT, SPECIAL,  INCIDENTAL, OR  CONSEQUENTIAL DAMAGES
# ARISING OUT  OF THE  USE OF THIS  SOFTWARE, ITS DOCUMENTATION,  OR ANY
# DERIVATIVES  THEREOF, EVEN  IF THE  AUTHOR  HAVE BEEN  ADVISED OF  THE
# POSSIBILITY OF SUCH DAMAGE.
#
# THE  AUTHOR  AND DISTRIBUTORS  SPECIFICALLY  DISCLAIM ANY  WARRANTIES,
# INCLUDING,   BUT   NOT  LIMITED   TO,   THE   IMPLIED  WARRANTIES   OF
# MERCHANTABILITY,  FITNESS   FOR  A  PARTICULAR   PURPOSE,  AND
# NON-INFRINGEMENT.  THIS  SOFTWARE IS PROVIDED  ON AN "AS  IS" BASIS,
# AND  THE  AUTHOR  AND  DISTRIBUTORS  HAVE  NO  OBLIGATION  TO  PROVIDE
# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

namespace eval Dividend_Test_Wrapper {

proc Init {} {
    global env
	package require htmlparse
    
    uplevel #0 {source $env(WEB_DRIVER_HOME)/dividend/dividend_fsm.tcl}
    uplevel #0 {source $env(WEB_DRIVER_HOME)/dividend/dividend.tcl}

    Fsm::Load_Fsm $env(WEB_DRIVER_HOME)/dividend/dividend_fsm.dat
    Fsm::Init_Fsm dividend_fsm

    array set data {}
    set fd [open $env(WEB_DRIVER_HOME)/dividend/url.template r]
    gets $fd url_template
    close $fd

    array set mapper {}
    set fd [open $env(WEB_DRIVER_HOME)/dividend/symbol.map r]
    while {[gets $fd line] > -1} {
		set mapper([lindex $line 0]) [lrange $line 1 end]
	} 
    close $fd

    dividend::init $url_template mapper
}

proc Runit {exchange cur_symbol p_rc} {
    upvar $p_rc rc

    dividend::extract_data $cur_symbol rc
    return 
}

}