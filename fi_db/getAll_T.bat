erase fi_db.dat
erase report_T.dat
tclsh fi_db_test.tcl /disk2/web_driver/common/financials_T fi_db.dat
tclsh fi_db_test2.tcl fi_db.dat /disk2/web_driver/common/fundamental_T
tclsh fi_db_test3.tcl fi_db.dat /disk2/web_driver/common/dividend_T
tclsh fi_db_test4.tcl fi_db.dat
tclsh fi_db_test5.tcl fi_db.dat /disk2/web_driver/common/warrant TSX 
tclsh fi_db_test6.tcl fi_db.dat /disk2/web_driver/common/debenture TSX
tclsh fi_db_test7.tcl fi_db.dat /disk2/web_driver/common/optiondata TSX
tclsh fi_db_dump.tcl fi_db.dat report_T.dat
