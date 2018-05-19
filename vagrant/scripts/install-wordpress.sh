# install-wordpress.sh
#
# Installs Wordpress
#
# @author Jason chan

#!/bin/bash

echo "WordPress Install Script ============================"

#change dir to www
cd /var/www/badgerherald.test/

#download wordpress
curl -O https://wordpress.org/latest.tar.gz

#unzip wordpress
tar -zxvf latest.tar.gz wordpress

#remove zip file
rm latest.tar.gz

echo "WordPress Downloaded ================================"

