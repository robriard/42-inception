#!/bin/sh
if  [ ! -f /var/www/wordpress/wp-config.php ];
then
    wp core --allow-root download --locale=fr_FR --force 
    wp core install --allow-root --url=$DOMAIN_NAME --title='Inception Project' --admin_user=$MYSQL_ROOT_USER --admin_password=$MYSQL_ROOT_PASSWORD  --admin_email=$MYSQL_ROOT_EMAIL --path='/var/www/html';
    wp  user create --allow-root $MYSQL_USER $MYSQL_EMAIL --user_pass=$MYSQL_PASSWORD --role=author
fi
php-fpm7.3 -F
