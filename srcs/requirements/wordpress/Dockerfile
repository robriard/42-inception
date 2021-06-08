FROM			alpine:3.12
LABEL			maintainer="robriard"


#	GENERATING DEFAULT START FOLDER
WORKDIR			/var/www/html

#	INSTALL PHP
RUN				apk update && apk add --no-cache php7.3 php7.3-fpm php-mysqli


#	COPY CONFIGURATION FILES
COPY			./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY			./srcs/wp_entrypoint.sh /wp_entrypoint.sh
RUN				mkdir -p /run/php	\
&& chmod +x /entrypoint-wordpress.sh



#	START SERVER
ENTRYPOINT		[/wp_entrypoint.sh]

#	EXPOSE PORT
EXPOSE			9000
