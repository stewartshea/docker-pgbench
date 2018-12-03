#!/bin/tclsh

puts "TEST DB is $::env(TEST_NAME)"
puts "SETTING CONFIGURATION"
global complete
proc wait_to_complete {} {
global complete
set complete [vucomplete]
if {!$complete} {after 5000 wait_to_complete} else { exit }
}
dbset db pg
diset connection pg_host $::env(PGHOST)
diset connection pg_port 5432
diset tpcc pg_user $::env(TEST_NAME)
diset tpcc pg_pass $::env(TEST_NAME)
diset tpcc pg_dbase $::env(TEST_NAME)
dbset bm TPC-C
print dict
buildschema
wait_to_complete
