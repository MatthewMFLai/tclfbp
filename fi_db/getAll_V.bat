earse fi_db_v.dat
erase report_V.dat
tclsh fi_db_test.tcl /disk2/web_driver/common/financials_V fi_db_v.dat
tclsh fi_db_test2.tcl fi_db_v.dat /disk2/web_driver/common/fundamental_V
tclsh fi_db_test3.tcl fi_db_v.dat /disk2/web_driver/common/dividend_V
tclsh fi_db_test4.tcl fi_db_v.dat
tclsh fi_db_test5.tcl fi_db_v.dat /disk2/web_driver/common/warrant TSX-VEN
tclsh fi_db_test6.tcl fi_db_v.dat /disk2/web_driver/common/debenture TSX-VEN
tclsh fi_db_dump.tcl fi_db_v.dat report_V.dat
