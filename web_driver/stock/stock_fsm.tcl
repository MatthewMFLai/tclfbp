# Copyright (C) 2017 by Matthew Lai, email : mmlai@sympatico.ca
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
# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS
namespace eval stock_fsm {

variable m_rx_list
variable m_data

proc init {} {
    variable m_rx_list
    variable m_data

# For market cap
#QuoteSummary-Proxy ... data-reactid="129">245B<
# For pe 
#QuoteSummary-Proxy ... data-reactid="139">13.45<
# For EPS 
#QuoteSummary-Proxy ... data-reactid="144">7.82<
# For price to book ratio 
#"priceToBook":{"raw":2.1331537,"fmt":"2.13"}
# For volume 
#QuoteSummary-Proxy ... data-reactid="116">265,500<
# For price 
#Real Time Price ... data-reactid="32">105.23<
	
	set m_rx_list {{market_cap QuoteSummary-Proxy.*?data-reactid=\"129\">(.*?)< nul} \
                   {pe QuoteSummary-Proxy.*?data-reactid=\"139\">(.*?)<  nul} \
                   {eps QuoteSummary-Proxy.*?data-reactid=\"144\">(.*?)< nul} \
                   {pb \"priceToBook\":\{\"raw\":.*?,\"fmt\":\"(.*?)\" nul} \
				   {volume QuoteSummary-Proxy.*?data-reactid=\"116\">(.*?)< nul} \
				   {price {Real Time Price.*?data-reactid=\"32\">(.*?)<} nul} \
                  }
    if {[info exists m_data]} {
	    unset m_data
    }
    array set m_data {}

    return
}

proc trim_trail_zero {data} {
    set idx [string first "." $data]
	if {$idx == -1} {
	    return $data
	}
    set lastidx [string length $data]
	incr lastidx -1
	while {$lastidx > $idx} {
        if {[string index $data $lastidx] != "0"} {
		    break
		}
	    incr lastidx -1
	}
	if {$lastidx != $idx} {
	    return [string range $data 0 $lastidx]
	} else {
	   return [string range $data 0 [expr $idx - 1]]
	}
}

proc multiply {data factor} {
	set data [string range $data 0 end-1]
	return [expr $data * $factor]	
}

proc process_generic {p_data} {
    upvar $p_data argarray
    variable m_rx_list
    variable m_data

    set data $argarray(data)
    foreach rx_tokens $m_rx_list {
		set key [lindex $rx_tokens 0]
		set exp [lindex $rx_tokens 1]
		set default [lindex $rx_tokens 2]
		if {[regexp $exp $data -> s1]} {
		    if {$s1 != "N/A"} {
				regsub -all "," $s1 "" s1
				regsub -all "\t" $s1 "" s1
				set s1 [string trim $s1]
				if {[string index $s1 end] == "M"} {
					set s1 [multiply $s1 1000000]
				} elseif {[string index $s1 end] == "B"} {
					set s1 [multiply $s1 1000000000]
				}
				set s1 [trim_trail_zero $s1]			
				set m_data($key) $s1
			}
		} else {
			#set m_data($key) $default
		}
    }

    if {[info exists m_data(volume)]} {
		set token $m_data(volume)
		regsub -all "\t" $token "" token
		regsub -all "\n" $token "" token
		set m_data(volume) $token
    }
	
    return
}
	    
proc Dump_Stock {p_data} {
    upvar $p_data data
    variable m_data

    array set data [array get m_data]
    return
}

proc Dump {} {
    variable m_data

    foreach idx [lsort [array names m_data]] {
		puts "$idx $m_data($idx)"
    }
    return
}

}
