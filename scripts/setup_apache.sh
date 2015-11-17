#!/bin/bash

#this can be executed after bootstrap.sh to set up apache2 and mod-wsgi

apt-get -y install apache2 libapache2-mod-wsgi
a2enmod wsgi
a2enmod ssl

#Generate a certificate with a nexpiration date 100 years in the future
openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout testhalsorapport.key -out testhalsorapport.crt
mv testhalsorapport.key /etc/apache2/certificate-test/
mv testhalsorapport.crt /etc/apache2/certificate-test/

mkdir /etc/apache2/certificate-test
ls -s /etc/apache2/certificate-test /etc/apache2/certificate


rm -rf /etc/apache/sites-enabled/*
rm -rf /etc/apache/sites-available/*

cp /var/www/hrpt/scripts/halsorapport.conf /etc/apache/sites-available/
cp /var/www/hrpt/scripts/halsorapport-ssl.conf /etc/apache/sites-available/

ln -s /etc/apache/sites-available/halsorapport.conf /etc/apache/sites-enabled/halsorapport.conf
ln -s /etc/apache/sites-available/halsorapport-ssl.conf /etc/apache/sites-enabled/halsorapport-ssl.conf



#static assets from the admin and the cms admin need to be copied in the media folder server by apache

#django admin first....
mkdir /var/www/hrpt/admin/
cp -r /var/www/hrpt/lib/python2.7/site-packages/django/contrib/admin/media/* /var/www/hrpt/admin/


# for the cms assets we need resync because it is in fact a copy-merge of files what we need to do.
rsync -a --ignore-existing /var/www/hrpt/lib/python2.7/site-packages/cms/media/cms/ /var/www/hrpt/media/cms/


# now set up django media path so everything works fine
echo -e "\n\nADMIN_MEDIA_PREFIX = '/media/admin/'\n" >> /var/www/hrpt/local_settings.py


sudo service apace2 restart

