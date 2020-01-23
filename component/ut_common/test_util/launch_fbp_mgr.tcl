source $env(DISK2)/fbp_draw/fbp_draw_launch.tcl
source $env(COMP_HOME)/ut_common/cfg_if.tcl
source $env(COMP_HOME)/ut_common/test_util/parse_testfile.tcl

Testfile_Parser::Init [lindex $argv 0]
set id [Testfile_Parser::Get_Id] 
set nodefile [Testfile_Parser::Get_Nodefile] 
set linkfile [Testfile_Parser::Get_Linkfile] 
set exp_nodefile $env(DISK2)/scratchpad/tmp/$id.node
set exp_linkfile $env(DISK2)/scratchpad/tmp/$id.link

set cfgfiles [Testfile_Parser::Get_Cfgfiles] 

FbpDraw::launch_init $cfgfiles
FbpDraw::Mgr_Init
FbpDraw::Mgr_Sweep $FbpDraw::m_ipaddrlist

# Extract the set of ip names from node file
set fd [open $nodefile r]
while {[gets $fd line] > -1} {
	lappend ipnames [lindex $line 2]
}
close $fd
set ipnames [lsort -unique $ipnames]

# Check for typos with ipnames.
set ipnamelist [FbpMgr::getipnames]
foreach ipname $ipnames {
	if {[lsearch $ipnamelist $ipname] == -1} {
		puts "$ipname not found in name list $ipnamelist"
		exit -1
	}
}

exec tclsh $env(FBP_HOME)/fbp_postproc.tcl $nodefile $linkfile $exp_nodefile $exp_linkfile
FbpDraw::Mgr_Run $id $exp_nodefile $exp_linkfile $ipnames
file delete -force $exp_nodefile 
file delete -force $exp_linkfile

set ready 1
after 5000 {unset ready}
vwait ready

FbpDraw::Mgr_Stop $id
set ready 1
after 500 {unset ready}
vwait ready

exit
