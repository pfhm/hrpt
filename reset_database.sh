#!/bin/bash

# WARNING: this will delete your database!
# Make sure this is really what you want to do before
# you execute this script.



echo "\nCreating database $DB_NAME ... "
psql --host=localhost --username=admin template1 <<EOF
        DROP DATABASE IF EXISTS epiwork ;
        DROP USER IF EXISTS epiwork ;
        CREATE USER epiwork WITH ENCRYPTED PASSWORD 'epiwork' ;
        CREATE DATABASE epiwork WITH OWNER = epiwork ;
EOF


echo "\nLoading the data from SQL dump file into the database...\n"
psql --username=admin --host=localhost epiwork -f /var/www/hrpt/db_dump.sql 2>&1 > out.sql
