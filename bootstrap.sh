#!/bin/bash

DB_ENGINE="postgresql"
POSTGRES_SUPERUSER_USERNAME="admin"
DB_NAME="epiwork"
DB_HOST="localhost"
DB_USERNAME="epiwork"
DJANGO_ENGINE="postgresql_psycopg2"
TIMEZONE="Europe/Stockholm"  # This is the same that is obtained by running 'cat Europe/Stockholm'
LANGUAGE="sv"
COUNTRY="sv"


# Just doing some basic cleanup and update after a fresh install
rm /var/lib/apt/lists/* -vf
apt-get  clean
apt-get  autoremove
apt-get  update

# We need to install git first so we can pull the source, in which the list of dependencies live
apt-get install -y git

# just setting basic git properties so we can commit from here if we so wish
git config --global user.email "developer@fhm"
git config --global user.name "Joe FHM developer"

	
# now clone the git repo
mkdir /var/www
cd /var/www
git clone -b 2013-1 https://github.com/pfhm/hrpt.git


#install all necessairy apt depoendencies. Many pip modules won't install if we don't do this.


echo "lets install all the apt-dependencies"
apt-get install -y $(cat /var/www/hrpt/apt-dependencies.txt | tr '\n' ' ')

#TODO: add these to apt-dependencies-dev
apt-get install -y libjpeg8 libjpeg8-dev libfreetype6 libfreetype6-dev zlib1g-dev


#enable password login for root
# this is useful for editing files over SFTP, but should not be enabled in production
# TODO: wrap this in getops and don't run by default
sed -i 's/PermitRootLogin\swithout-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service ssh reload

#these are necessairy for pil, no ideia why they aren't linked or placed under /usr/lib
ln -s /usr/lib/i386-linux-gnu/libfreetype.so /usr/lib/
ln -s /usr/lib/i386-linux-gnu/libz.so /usr/lib/
ln -s /usr/lib/i386-linux-gnu/libjpeg.so /usr/lib/
ln -s /usr/include/freetype2 /usr/include/freetype

# now we get inside the virtual environment and go crazy!!!
cd /var/www/hrpt
virtualenv --no-site-packages .
source ./bin/activate

# these two modules need these flags because they wouldn't be installable otherwise
# AFAIUI they have dependencied on external hosted modules and/or do not provide checksums
pip install PIL --allow-external PIL --allow-unverified PIL
pip install postmarkup --allow-external postmarkup --allow-unverified postmarkup

#now  install the rest of the pip dependencies
pip install -r /var/www/hrpt/requirements.txt


# Lets now	create a superuser for postgres
# you'll be prompt for a password
echo "Let's create a new postgresql role...\n"
su postgres -c "createuser --pwprompt --superuser $POSTGRES_SUPERUSER_USERNAME"

# And instal plpgsql on the template1 database
# which suposedly is the template all new databases are based on

su postgres -c "createlang plpgsql template1"


while [ -z "$DB_PASSWORD" ] ; do
	echo -n "Database password ( username is '$DB_USERNAME'): "
	read line && [ -n "$line" ] && DB_PASSWORD="$line";
done    


echo ""
echo "Configuration parameters:"
echo ""
echo "  country and language: $LANGUAGE"
echo "  time zone:            $TIMEZONE"
echo "  database engine:      $DB_ENGINE ($DJANGO_ENGINE)"
echo "  database name:        $DB_NAME"
echo "  database host:        $DB_HOST"
echo "  database username:    $DB_USERNAME"
echo "  database password:    $DB_PASSWORD"
echo ""
echo "We are about to generate a new Django configuration and to create a new"
echo "database. This will destroy your previous configuration and make you lose"
echo "all you data. Make sure all parameters are correct before proceeding."
echo ""
echo -n "Please, type YES if you want to preceed or ABORT to exit now: "

line=""
while [ -z "$line" ] ; do
    read line
    if [ "$line" = "ABORT" ] ; then exit 0 ; fi
    if [ "$line" != "YES" ] ; then line="" ; fi
done


echo "\nGenerating settings.py ... "
cat local_settings.py.in \
    | sed -e "s/@DB_ENGINE@/django.db.backends.$DJANGO_ENGINE/g" \
    | sed -e "s/@DB_NAME@/$DB_NAME/g" \
    | sed -e "s/@DB_HOST@/$DB_HOST/g" \
    | sed -e "s/@DB_PORT@/$DB_PORT/g" \
    | sed -e "s/@DB_USERNAME@/$DB_USERNAME/g" \
    | sed -e "s/@DB_PASSWORD@/$DB_PASSWORD/g" \
    | sed -e "s/@LANGUAGE@/$LANGUAGE/g" \
    | sed -e "s/@COUNTRY@/$COUNTRY/g" \
    | sed -e "s%@TIMEZONE@%$TIMEZONE%g" \
    > local_settings.py
	
	

echo "\nCreating database $DB_NAME ... "
psql --host=$DB_HOST --username=$POSTGRES_SUPERUSER_USERNAME template1 <<EOF
	DROP DATABASE IF EXISTS $DB_NAME ;
	DROP USER IF EXISTS $DB_USERNAME ;
	CREATE USER $DB_USERNAME WITH ENCRYPTED PASSWORD '$DB_PASSWORD' ;
	CREATE DATABASE $DB_NAME WITH OWNER = $DB_USERNAME ;
EOF

	
echo "\nLoading the data from SQL dump file into the database...\n"
psql --username=$POSTGRES_SUPERUSER_USERNAME --host=$DB_HOST $DB_NAME < /var/www/hrpt/db_dump.sql


echo "\nLoading postgis data into the database ...\n"
postgis="/usr/share/postgresql/9.3/contrib/postgis-2.1/postgis.sql"
srefsys="/usr/share/postgresql/9.3/contrib/postgis-2.1/spatial_ref_sys.sql"

psql --username=$POSTGRES_SUPERUSER_USERNAME --host=$DB_HOST $DB_NAME <<EOF
\i $postgis
\i $srefsys
CREATE TABLE pollster_zip_codes (id serial, country TEXT, zip_code_key TEXT);
SELECT AddGeometryColumn('pollster_zip_codes', 'geometry', 4326, 'MULTIPOLYGON', 2);
ALTER TABLE pollster_zip_codes OWNER TO $DB_USERNAME;
ALTER TABLE spatial_ref_sys OWNER TO $DB_USERNAME;
ALTER TABLE geometry_columns OWNER TO $DB_USERNAME;
ALTER VIEW geography_columns OWNER TO $DB_USERNAME;
EOF

echo "The end."
