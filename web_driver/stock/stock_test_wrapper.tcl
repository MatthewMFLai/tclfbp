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

namespace eval Stock_Test_Wrapper {

proc Init {} {
	global tcl_platform
	global env

	if {$tcl_platform(platform) != "unix"} {
		lappend auto_path $env(DISK2)/tclkit/modules
	}

	uplevel #0 {source $env(FSM_HOME)/fsm.tcl}
	uplevel #0 {source $env(PATTERN_HOME)/malloc.tcl}
	uplevel #0 {source $env(PATTERN_HOME)/geturl.tcl}
	uplevel #0 {source $env(PATTERN_HOME)/stock_util.tcl}
	uplevel #0 {source $env(WEB_DRIVER_HOME)/stock/stock_fsm.tcl}
	uplevel #0 {source $env(WEB_DRIVER_HOME)/stock/stock.tcl}

	Url::init
	malloc::init
	Fsm::Init

	Fsm::Load_Fsm $env(WEB_DRIVER_HOME)/stock/stock_fsm.dat
	Fsm::Init_Fsm stock_fsm

	array set data {}
	set fd [open $env(WEB_DRIVER_HOME)/stock/url.template r]
	gets $fd url_template
	close $fd
	stock::init $url_template
}

proc Runit {exchange cur_symbol p_rc} {
	upvar $p_rc rc

	stock::extract_data $exchange $cur_symbol rc 
	return
}

}
