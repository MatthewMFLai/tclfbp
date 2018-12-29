rm fi_db_v.dat
rm report_V.dat
fi_db_test.tcl $WEB_DRIVER_HOME/common/financials_V fi_db_v.dat
fi_db_test2.tcl fi_db_v.dat $WEB_DRIVER_HOME/common/fundamental_V
fi_db_test3.tcl fi_db_v.dat $WEB_DRIVER_HOME/common/dividend_V
fi_db_test4.tcl fi_db_v.dat
fi_db_test5.tcl fi_db_v.dat $WEB_DRIVER_HOME/common/warrant TSX-VEN
fi_db_test6.tcl fi_db_v.dat $WEB_DRIVER_HOME/common/debenture TSX-VEN
fi_db_dump.tcl fi_db_v.dat report_V.dat 
