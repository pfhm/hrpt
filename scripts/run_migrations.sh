!/bin/bash

# This sctipt will run all the sql files under
# var/www/hrpt/db/migrations
#
# For convenience, set your environment variable PGPASSWORD
#
# Keep in mind that this only works with password authentication,
# not with peer authentication
#

#TODO save the last executed migration name in a colum
# then run only those who are earlier than that

#TODO: of course, to make the above, a table need to be created if it doesn't exist

for f in `find /var/www/hrpt/db/migrations -name "*.sql" | sort`; do
  echo -e " * \e[32mRuning $f ...\e[0m"
  psql --username=admin --host=localhost epiwork -f $f
done
