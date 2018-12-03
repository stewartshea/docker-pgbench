#!/bin/tclsh
proc rndname len {
 set s "abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789"
 for {set i 0} {$i <= $len} {incr i} {
    append p [string index $s [expr {int([string length $s]*rand())}]]
 }
 return $p
}
set dbtest [rndname 8]
puts "TEST DB is $dbtest "
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
diset tpcc pg_dbase $dbtest
dbset bm TPC-C
print dict
buildschema
wait_to_complete
