#!/bin/sh

#test
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i 's/votre_nom_de_bdd/'$WORDPRESS_DB_NAME'/' /var/www/html/wp-config.php
sed -i 's/votre_utilisateur_de_bdd/'$WORDPRESS_DB_USER'/' /var/www/html/wp-config.php
sed -i 's/votre_mdp_de_bdd/'$WORDPRESS_DB_PASSWORD'/' /var/www/html/wp-config.php
sed -i 's/localhost/'$WORDPRESS_DB_HOST'/' /var/www/html/wp-config.php
sed -i 's/wp_/'$WORDPRESS_TABLE_PREFIX'/' /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/html
#

php-fpm7.3 -F
