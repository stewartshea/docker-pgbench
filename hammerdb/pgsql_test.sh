#!/bin/bash
echo 'STARTING SCHEMA BUILD'

./hammerdbcli <<!
source pgsql_build.tcl
source pgsql_driver_test.tcl
!

echo 'SCHEMA BUILD COMPLETE'

