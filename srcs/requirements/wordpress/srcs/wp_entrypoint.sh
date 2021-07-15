#!/bin/sh
if [ $(ls /var/www/html/ | wc -l | sed -e "s/ //g") == "0"]
then
	curl -LO https://wordpress.org/latest.tar.gz && tar xzvf latest.tar.gz
	mv wordpress/* /var/www/html/ && rm -rf latest.tar.gz
fi
if  [ ! -f /var/www/html/wp-config.php ];
then
	wp core --allow-root download --locale=fr_FR --force --path='/var/www/html' 
	while  [ ! -f /var/www/html/wp-config.php ];
	do   
		wp core config --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306
	done
		wp core install --allow-root --url=$DOMAIN_NAME --title='Inception Project' --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS  --admin_email=$WP_ADMIN_EMAIL --path='/var/www/html';
	wp  user create --allow-root $WP_AUTHOR_USER $WP_AUTHOR_EMAIL--user_pass=$WP_AUTHOR_PASS --role=author
fi
php-fpm7.3 -F
