#!/bin/tclsh
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
dbset bm TPC-C
print dict
buildschema
wait_to_complete
