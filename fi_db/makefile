TCL = tclsh
target:
	$(TCL) $(SCDS_HOME)/scds_gen_test.tcl config.dat $(FI_DB_HOME) FI_DB_HOME
	make -C $(FI_DB_HOME)/dat
	make -C $(FI_DB_HOME)/gencode/simple
	make -C $(FI_DB_HOME)/gencode/complex

clean :
	make -C $(FI_DB_HOME)/dat clean
	make -C $(FI_DB_HOME)/gencode/simple clean
	make -C $(FI_DB_HOME)/gencode/complex clean
	$(TCL) $(SCDS_HOME)/scds_gen_test.tcl clean $(FI_DB_HOME) 
