TCL =
RM = rm
corepanel : byTokens.tcl 

byTokens.tcl : $(PATTERN_HOME)/tree.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/tree byTokens

clean :
	$(RM) byTokens.tcl 
