#!/bin/bash

set -x

#this can be executed after bootstrap.sh to set up apache2 and mod-wsgi


echo -e "\ninstalling apache and all necessairy mods\n..."

apt-get -y install apache2 libapache2-mod-wsgi
a2enmod wsgi
a2enmod ssl
a2enmod rewrite


echo -e "Now we're going to generate the SSL certificates am place them in the right location...\n"

mkdir /etc/apache2/certificate-test
ln -s /etc/apache2/certificate-test /etc/apache2/certificate

#generate key
openssl genrsa -des3 -out /etc/apache2/certificate-test/testhalsorapport.key 4096

#generate csr
openssl req -new \
      -key /etc/apache2/certificate-test/testhalsorapport.key \
      -out /etc/apache2/certificate-test/testhalsorapport.csr

#signing it
openssl x509 -req -days 5000 \
      -in /etc/apache2/certificate-test/testhalsorapport.csr \
      -signkey /etc/apache2/certificate-test/testhalsorapport.key \
      -out /etc/apache2/certificate-test/testhalsorapport.crt


# decrypt the key so we are not required to enter the passphrase on each restart
openssl rsa \
      -in /etc/apache2/certificate-test/testhalsorapport.key \
      -out /etc/apache2/certificate-test/testhalsorapport.key.insecure

#Changing names a little bit for clarity, we are going to use the insecure key
#we don't really need the secure one, but oh well, let's leave it
mv /etc/apache2/certificate-test/testhalsorapport.key /etc/apache2/certificate-test/testhalsorapport.key.secure
mv /etc/apache2/certificate-test/testhalsorapport.key.insecure /etc/apache2/certificate-test/testhalsorapport.key


###########################################################################


echo -e "\nAlright, next step is to copy the configs from our working copy to the apache config folder...\n"
#remove existing site conconfigs...
rm -rf /etc/apache2/sites-enabled/*
rm -rf /etc/apache2/sites-available/*

#We are going to do it the ubuntu way. Place the configs in sites-available and link them from sites-enabled
cp /var/www/hrpt/scripts/halsorapport.conf /etc/apache/sites-available/
cp /var/www/hrpt/scripts/halsorapport-ssl.conf /etc/apache/sites-available/

ln -s /etc/apache/sites-available/halsorapport.conf /etc/apache/sites-enabled/halsorapport.conf
ln -s /etc/apache/sites-available/halsorapport-ssl.conf /etc/apache/sites-enabled/halsorapport-ssl.conf

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
