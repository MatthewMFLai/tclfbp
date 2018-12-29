rm fi_db.dat
rm report_T.dat
fi_db_test.tcl $WEB_DRIVER_HOME/common/financials_T fi_db.dat
fi_db_test2.tcl fi_db.dat $WEB_DRIVER_HOME/common/fundamental_T
fi_db_test3.tcl fi_db.dat $WEB_DRIVER_HOME/common/dividend_T
fi_db_test4.tcl fi_db.dat
fi_db_test5.tcl fi_db.dat $WEB_DRIVER_HOME/common/warrant TSX 
fi_db_test6.tcl fi_db.dat $WEB_DRIVER_HOME/common/debenture TSX
fi_db_test7.tcl fi_db.dat $WEB_DRIVER_HOME/common/optiondata TSX
fi_db_dump.tcl fi_db.dat report_T.dat 
