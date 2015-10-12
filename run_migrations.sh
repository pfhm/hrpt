!/bin/bash

# This sctipt will run all the sql files under
# var/www/hrpt/db/migrations
#
# For convenience, set your environment variable PGPASSWORD 
# 
# Keep in mind that this only works with password authentication,
# not with peer authentication
#  

for f in `find /var/www/hrpt/db/migrations -name "*.sql" | sort`; do
  echo -e " * \e[32mRuning $f ...\e[0m"
  psql --username=admin --host=localhost epiwork -f $f  
done
