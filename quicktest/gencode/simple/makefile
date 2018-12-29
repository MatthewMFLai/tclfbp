TCL =
RM = rm
corepanel : byText.tcl 

byText.tcl : $(QUICKTEST_HOME)/dat/text.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(QUICKTEST_HOME)/dat/text byText

clean :
	$(RM) byText.tcl 
