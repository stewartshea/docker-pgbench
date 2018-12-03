#!/bin/tclsh
puts "GENERATING TEST DB NAME"
proc rndpassword len {
 set s "abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789"
 for {set i 0} {$i <= $len} {incr i} {
    append p [string index $s [expr {int([string length $s]*rand())}]]
 }
 return $p
}
puts "TEST DB is $p"
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
diset connection pg_dbase $p
dbset bm TPC-C
print dict
buildschema
wait_to_complete
