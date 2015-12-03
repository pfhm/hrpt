#!/bin/bash

set -x

#this can be executed after bootstrap.sh to set up apache2 and mod-wsgi


echo -e "\ninstalling apache and all necessairy mods\n..."

apt-get -y install apache2 libapache2-mod-wsgi
a2enmod wsgi
a2enmod rewrite


echo -e "\nAlright, next step is to copy the configs from our working copy to the apache config folder...\n"
#remove existing site conconfigs...
rm -rf /etc/apache2/sites-enabled/*
rm -rf /etc/apache2/sites-available/*

#We are going to do it the ubuntu way. Place the configs in sites-available and link them from sites-enabled
cp /var/www/hrpt/scripts/halsorapport.conf /etc/apache2/sites-available/


#TODO: pass the hostname as acommand line argument and replace in the config file

ln -s /etc/apache2/sites-available/halsorapport.conf /etc/apache2/sites-enabled/halsorapport.conf

echo -e "\nchmoding wsgi.py...\n"
chmod 755 /var/www/hrpt/wsgi.py

echo -e "\nNow copy some assets from the admin and the cms that live in the correspondent python module folder...\n"

#django admin first....
mkdir /var/www/hrpt/media/admin/
cp -r /var/www/hrpt/lib/python2.7/site-packages/django/contrib/admin/media/* /var/www/hrpt/media/admin/

# for the cms assets we need rsync because it is in fact a copy-merge of files what we need to do.
rsync -a --ignore-existing /var/www/hrpt/lib/python2.7/site-packages/cms/media/cms/ /var/www/hrpt/media/cms/

# now set up django media path so everything works fine
echo -e "\n\nADMIN_MEDIA_PREFIX = '/media/admin/'\n" >> /var/www/hrpt/local_settings.py


#TODO: we need to change the persmissions on cms media folder so users can upload files via cms
# read more here: http://stackoverflow.com/questions/1682440/permission-denied-error-with-django-while-uploading-a-file

#restart apache and we should be all good!!!
sudo service apache2 restart
