#!/bin/tclsh
proc rndname len {
 set s "abcdefghjkmnpqrstuvwxyz"
 for {set i 0} {$i <= $len} {incr i} {
    append p [string index $s [expr {int([string length $s]*rand())}]]
 }
 return $p
}
set testname [rndname 4]
puts "TEST DB is $testname "
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
diset tpcc pg_user $testname
diset tpcc pg_pass $testname
diset tpcc pg_dbase $testname
dbset bm TPC-C
print dict
buildschema
wait_to_complete
