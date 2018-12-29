TCL = tclsh
target:
	$(TCL) $(SCDS_HOME)/scds_gen_test.tcl config.dat $(CONTENT_HOME) CONTENT_HOME
	make -C $(CONTENT_HOME)/dat
	make -C $(CONTENT_HOME)/gencode/simple
	make -C $(CONTENT_HOME)/gencode/complex

clean :
	make -C $(CONTENT_HOME)/dat clean
	make -C $(CONTENT_HOME)/gencode/simple clean
	make -C $(CONTENT_HOME)/gencode/complex clean
	$(TCL) $(SCDS_HOME)/scds_gen_test.tcl clean $(CONTENT_HOME)
