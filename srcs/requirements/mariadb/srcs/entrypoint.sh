#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ];
then
	mysql_install_db --datadir=/var/lib/mysql
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
	echo "CREATE USER IF NOT EXISTS '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'" | mysql -u root
	echo "GRANT ALL ON wordpress .* TO '$MYSQL_ROOT_USER'@'%'" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mysql -u root
	service mysql stop
fi
#exec /usr/sbin/mysqld
exec /bin/bash
