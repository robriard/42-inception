FROM			alpine:3.12
LABEL			maintainer="robriard"


#	GENERATING DEFAULT START FOLDER
WORKDIR			/var/www/html

#	INSTALL PHP
RUN				apk update	\
&& apk add --no-cache lighttpd php7-common php7-session php7-iconv php7-json	\
php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo			\
php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext		\
php7-ldap php7-ctype php7-dom



#	COPY CONFIGURATION FILES
COPY			./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY			./srcs/wp_entrypoint.sh /wp_entrypoint.sh
RUN				mkdir -p /run/php
#RUN				chmod +x /entrypoint-wordpress.sh



#	START SERVER
ENTRYPOINT		[/wp_entrypoint.sh]

#	EXPOSE PORT
EXPOSE			9000
