TCL =
RM = rm
corepanel : byTokens.tcl byAllWords.tcl byAuthor.tcl byTitle.tcl byAuthor_Title.tcl byLocalMeaning.tcl byConnect.tcl 

byTokens.tcl : $(PATTERN_HOME)/tree.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/tree byTokens

byAllWords.tcl : $(PATTERN_HOME)/assoc.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/assoc byAllWords

byAuthor.tcl : $(PATTERN_HOME)/assoc.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/assoc byAuthor

byTitle.tcl : $(PATTERN_HOME)/assoc.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/assoc byTitle

byAuthor_Title.tcl : $(PATTERN_HOME)/assoc.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/assoc byAuthor_Title

byLocalMeaning.tcl : $(PATTERN_HOME)/assoc.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/assoc byLocalMeaning

byConnect.tcl : $(PATTERN_HOME)/graph.tcl
	$(TCL) $(PATTERN_HOME)/genPattern.tcl $(PATTERN_HOME)/graph byConnect

clean :
	$(RM) byTokens.tcl byAllWords.tcl byAuthor.tcl byTitle.tcl byAuthor_Title.tcl byLocalMeaning.tcl byConnect.tcl 
