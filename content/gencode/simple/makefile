TCL =
RM = rm
corepanel : byText.tcl 

byText.tcl : $(CONTENT_HOME)/dat/text.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(CONTENT_HOME)/dat/text byText

clean :
	$(RM) byText.tcl 
