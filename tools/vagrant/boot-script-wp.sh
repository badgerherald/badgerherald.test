# boot-script-bhrld-wp.sh
# 
# Just to install wordpress
#
# @author Jason chan
# @see 

#!/bin/bash

echo ""
echo ""
echo ""
echo ""
echo "============================================"
echo "WordPress Install Script"
echo "============================================"

#change dir to www
cd /var/www/

#download wordpress
curl -O https://wordpress.org/latest.tar.gz

#unzip wordpress
tar -zxvf latest.tar.gz

# change dir to wordpress
cd wordpress

#copy paste unzipped files to actual wp folder
cp -r -f . ../wp

#change dir to www
cd ../

#remove wp-temp
rm -R wordpress

#remove zip file
rm latest.tar.gz


echo ''
echo '╔ Wordpress downloaded! ═══════════════════════════╗'
echo '║                                                  ║'             
echo '║       happy developing!                          ║'                       
echo '║                                                  ║'
echo '╚══════════════════════════════════════════════════╝'
echo ''

