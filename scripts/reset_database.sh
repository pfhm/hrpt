#!/bin/bash

# WARNING: this will delete your database!
# Make sure this is really what you want to do before
# you execute this script.

/etc/init.d/postgresql restart

echo "\nCreating database $DB_NAME ... "
psql --host=localhost --username=admin template1 <<EOF

DROP DATABASE IF EXISTS epiwork;
DROP USER IF EXISTS epiwork;
DROP ROLE IF EXISTS epiwork;
CREATE USER epiwork WITH ENCRYPTED PASSWORD 'epiwork';
CREATE DATABASE epiwork OWNER epiwork;

EOF


echo "\nLoading the data from SQL dump file into the database...\n"
psql --username=admin --host=localhost epiwork -f /home/p/livdump.sql  2>&1 > out.sql
