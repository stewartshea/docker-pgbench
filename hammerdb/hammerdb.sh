#!/bin/bash
echo 'GENERATING 6 CHARACTER RANDOM TEST NAME'
export TEST_NAME=$(cat /dev/urandom | tr -dc 'a-z' | fold -w 6 | head -n 1)

# echo 'STARTING SCHEMA BUILD'
# ./hammerdbcli <<!
# source pgsql_build.tcl
# !
# echo 'SCHEMA BUILD COMPLETE'
echo 'STARTING TEST'
./hammerdbcli <<!
source pgsql_driver_test.tcl
!

echo 'TEST COMPLETE'

