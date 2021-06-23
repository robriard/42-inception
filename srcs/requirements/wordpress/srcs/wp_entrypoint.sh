#!/bin/sh



cp  /var/www/html/wp-config.php /var/www/html/wp-config-sample.php
sed -i 's/database_name_here/'$WORDPRESS_DB_NAME'/' /var/www/html/wp-config.php
sed -i 's/username_here/'$MYSQL_USER'/' /var/www/html/wp-config.php
sed -i 's/password_here/'$MYSQL_PASSWORD'/' /var/www/html/wp-config.php
sed -i 's/localhost/'$WORDPRESS_DB_HOST'/' /var/www/html/wp-config.php
sed -i 's/wp_/'$WORDPRESS_TABLE_PREFIX'/' /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/html

php-fpm7.3 -F
