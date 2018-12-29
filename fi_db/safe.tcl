set slave_fi_db [interp create fi_db]
interp eval {fi_db} {
source $env(FI_DB_HOME)/fi_db_load.tcl
}
