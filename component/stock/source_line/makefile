TCL = tclsh
NODE = source_line
NODEDIR = source_line
TARGETDIR = /tmp/node/stock
PREFIX = /stock/source_line
ENVAR = FACTORY
release:
	$(TCL) $(PATTERN_HOME)/gen_release_node.tcl $(NODE).tcl $(NODE).tcl.new 
	$(TCL) $(PATTERN_HOME)/gen_release_dir.tcl $(TARGETDIR)
	rsync -Cav ../$(NODEDIR) $(TARGETDIR)
	$(TCL) $(PATTERN_HOME)/update_blk_file.tcl $(TARGETDIR)/$(NODEDIR) filepath blk $(PREFIX) $(ENVAR) 
	mv $(TARGETDIR)/$(NODEDIR)/$(NODE).tcl.new $(TARGETDIR)/$(NODEDIR)/$(NODE).tcl
	rm $(TARGETDIR)/$(NODEDIR)/makefile
	rm $(NODE).tcl.new

clean :
	rm -rf $(TARGETDIR)/$(NODEDIR)
