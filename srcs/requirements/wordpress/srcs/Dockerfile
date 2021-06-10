FROM			alpine:3.12
LABEL			maintainer="robriard"


#	GENERATING DEFAULT START FOLDER
WORKDIR			/var/www/html

#	INSTALL PHP
RUN				apk update	\
&& apk add php7 php7-fpm


#	COPY CONFIGURATION FILES
COPY			./srcs/www.conf /etc/php/7/fpm/pool.d/www.conf
COPY			./srcs/wp_entrypoint.sh /wp_entrypoint.sh
RUN				mkdir -p /run/php
RUN				chmod +x /wp_entrypoint.sh



#	START SERVER
ENTRYPOINT		["/wp_entrypoint.sh"]

#	EXPOSE PORT
EXPOSE			9000
