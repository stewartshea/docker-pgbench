#!/bin/bash
echo 'STARTING SCHEMA BUILD'

./hammerdbcli <<!
source pgsql_build.tcl
!

echo 'SCHEMA BUILD COMPLETE'

