#!/bin/bash

DB_ENGINE="postgresql"
POSTGRES_SUPERUSER_USERNAME="admin"
DB_NAME="epiwork"
DB_HOST="localhost"
#DB_PORT=""
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
	
# now clone the git repo
mkdir /var/www
cd /var/www
git clone -b 2013-1 https://github.com/pfhm/hrpt.git


#install all necessairy apt depoendencies. Many pip modules won't install if we don't do this.


echo "lets install all the apt-dependencies"
apt-get install -y $(cat /var/www/hrpt/apt-dependencies.txt | tr '\n' ' ')

#TODO: add these to apt-dependencies-dev
apt-get install -y libjpeg8 libjpeg8-dev libfreetype6 libfreetype6-dev zlib1g-dev

#these are necessairy for pil, no ideia why they aren't linked or placed under /usr/lib
ln -s /usr/lib/i386-linux-gnu/libfreetype.so /usr/lib/
ln -s /usr/lib/i386-linux-gnu/libz.so /usr/lib/
ln -s /usr/lib/i386-linux-gnu/libjpeg.so /usr/lib/
ln -s /usr/include/freetype2 /usr/include/freetype

# now we get inside the virtual environment and go crazy!!!
cd /var/www/hrpt
virtualenv .
source ./bin/activate

# these two modules need these flags because they wouldn't be installable otherwise
# AFAIUI they either have dependencied on external hosted modules and/or do not provide checksums
pip install PIL --allow-external PIL --allow-unverified PIL
pip install postmarkup --allow-external postmarkup --allow-unverified postmarkup

#now 
pip install -r /var/www/hrpt/requirements.txt



#####################################################################
## The following is based on what was on bootstrap.sh in september 2015
# For reference, here's a link from that time
# https://github.com/pfhm/hrpt/blob/d2e7f1920cae9af10817d3bcb044a5843ac8f95a/bootstrap.sh


#!/bin/bash
#
# Bootstraps everything installing Django and all required eggs, configuring
# the database and making sure a consistent Mono development environment is
# installed.

# Here we customize src/epiweb/settings.py by setting the user preferred
# database, language and country. Note that the database and the user used
# to connect should already exist.



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
#echo "  database port:        ${DB_PORT:-(default)}"
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

echo ""

echo "Creating database $DB_NAME ... "

args="--username=$POSTGRES_SUPERUSER_USERNAME template1"

#if [ -n "$DB_PORT" ] ; then
#	args="--port=$DB_PORT $args"
#fi

if [ -n "$DB_HOST" ] ; then
	args="--host=$DB_HOST $args"
fi


psql -q $args <<EOF
	DROP DATABASE IF EXISTS $DB_NAME ;
	DROP USER IF EXISTS $DB_USERNAME ;
	CREATE USER $DB_USERNAME WITH ENCRYPTED PASSWORD '$DB_PASSWORD' ;
	CREATE DATABASE $DB_NAME WITH OWNER = $DB_USERNAME ;
EOF
echo "PostgreSQL setup complete"

echo ""
echo -n "Generating settings.py ... "

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

echo "done"
echo ""
echo "Initializing Django database and loading default surveys:"
echo ""

python manage.py syncdb
# On PostgreSQL ovverride the order of migrated tables creating first
# referenced tables (journal migration fails if CMS isn't available.)
python manage.py migrate cms
python manage.py migrate
python manage.py rule_type_register --title 'Show Question' --jsclass 'wok.pollster.rules.ShowQuestion'
python manage.py rule_type_register --title 'Hide Question' --jsclass 'wok.pollster.rules.HideQuestion'
python manage.py rule_type_register --title 'Show Options' --jsclass 'wok.pollster.rules.ShowOptions'
python manage.py rule_type_register --title 'Hide Options' --jsclass 'wok.pollster.rules.HideOptions'
python manage.py rule_type_register --title 'Check Options' --jsclass 'wok.pollster.rules.CheckOptions'
python manage.py rule_type_register --title 'Uncheck Options' --jsclass 'wok.pollster.rules.UncheckOptions'
python manage.py rule_type_register --title 'Exclusive' --jsclass 'wok.pollster.rules.Exclusive'
python manage.py rule_type_register --title 'Future Fill' --jsclass 'wok.pollster.rules.FutureFill'
python manage.py rule_type_register --title 'Future Show Question' --jsclass 'wok.pollster.rules.FutureShowQuestion'
python manage.py rule_type_register --title 'Future Hide Question' --jsclass 'wok.pollster.rules.FutureHideQuestion'
python manage.py rule_type_register --title 'Future Show Options' --jsclass 'wok.pollster.rules.FutureShowOptions'
python manage.py rule_type_register --title 'Future Hide Options' --jsclass 'wok.pollster.rules.FutureHideOptions'
python manage.py rule_type_register --title 'Fill' --jsclass 'wok.pollster.rules.Fill'
python manage.py question_data_type_register --title 'Text' --dbtype 'django.db.models.TextField(null=True, blank=True)' --cssclass 'text-type' --jsclass 'wok.pollster.datatypes.Text'
python manage.py question_data_type_register --title 'Numeric' --dbtype 'django.db.models.PositiveIntegerField(null=True, blank=True)' --cssclass 'numeric-type' --jsclass 'wok.pollster.datatypes.Numeric'
python manage.py question_data_type_register --title 'Date' --dbtype 'django.db.models.DateField(null=True, blank=True)' --cssclass 'date-type' --jsclass 'wok.pollster.datatypes.Date'
python manage.py question_data_type_register --title 'YearMonth' --dbtype 'db.models.YearMonthField(null=True, blank=True)' --cssclass 'monthyear-type' --jsclass 'wok.pollster.datatypes.YearMonth'
python manage.py question_data_type_register --title 'Timestamp' --dbtype 'django.db.models.DateTimeField(null=True, blank=True)' --cssclass 'timestamp-type' --jsclass 'wok.pollster.datatypes.Timestamp'
# PostalCode is added by the pollster migration 0005_postalcodefield.py
# python manage.py question_data_type_register --title 'PostalCode' --dbtype 'django.db.models.PostalCodeField(null=True, blank=True)' --cssclass 'postalcode-type' --jsclass 'wok.pollster.datatypes.PostalCode'
python manage.py virtual_option_type_register --title 'Range' --question-data-type-title 'Text' --jsclass 'wok.pollster.virtualoptions.TextRange'
python manage.py virtual_option_type_register --title 'Range' --question-data-type-title 'Numeric' --jsclass 'wok.pollster.virtualoptions.NumericRange'
python manage.py virtual_option_type_register --title 'Range' --question-data-type-title 'Date' --jsclass 'wok.pollster.virtualoptions.DateRange'
python manage.py virtual_option_type_register --title 'Years ago' --question-data-type-title 'Date' --jsclass 'wok.pollster.virtualoptions.DateYearsAgo'
python manage.py virtual_option_type_register --title 'Years ago' --question-data-type-title 'YearMonth' --jsclass 'wok.pollster.virtualoptions.YearMonthYearsAgo'
python manage.py virtual_option_type_register --title 'Weeks ago' --question-data-type-title 'Timestamp' --jsclass 'wok.pollster.virtualoptions.TimestampWeeksAgo'
python manage.py virtual_option_type_register --title 'Regular expression' --question-data-type-title 'Text' --jsclass 'wok.pollster.virtualoptions.RegularExpression'

python manage.py createcachetable django_cache 2>/dev/null || echo 'Cache table errors ignored'


postgis="/usr/share/postgresql/9.3/contrib/postgis-2.1/postgis.sql"
srefsys="/usr/share/postgresql/9.3/contrib/postgis-2.1/spatial_ref_sys.sql"
if [ -n "$postgis" -a -n "$srefsys" ] ; then
	echo "Setting up PostGIS"
	args="--username=$POSTGRES_SUPERUSER_USERNAME $DB_NAME"
	if [ -n "$DB_PORT" ] ; then
		args="--port=$DB_PORT $args"
	fi
	if [ -n "$DB_HOST" ] ; then
		args="--host=$DB_HOST $args"
	fi
	psql -q $args <<EOF
\i $postgis
\i $srefsys
CREATE TABLE pollster_zip_codes (id serial, country TEXT, zip_code_key TEXT);
SELECT AddGeometryColumn('pollster_zip_codes', 'geometry', 4326, 'MULTIPOLYGON', 2);
ALTER TABLE pollster_zip_codes OWNER TO $DB_USERNAME;
ALTER TABLE spatial_ref_sys OWNER TO $DB_USERNAME;
ALTER TABLE geometry_columns OWNER TO $DB_USERNAME;
ALTER VIEW geography_columns OWNER TO $DB_USERNAME;
EOF
	echo "PostGIS setup complete"
fi
