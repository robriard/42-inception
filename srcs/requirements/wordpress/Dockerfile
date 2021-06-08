FROM			debian:buster
LABEL			maintainer="robriard"


#	GENERATING DEFAULT START FOLDER
WORKDIR			/var/www/html


#	INSTALL PHP
RUN				apt-get -qy update && apt-get -qy upgrade \
&& apt-get -qy install php7.3 php7.3-fpm php-mysqli

#	COPY CONFIGURATION FILES
COPY			./wp_entrypoint.sh /wp_entrypoint.sh

#	START SERVER
ENTRYPOINT		[/bin/sh /wp_entrypoint.sh]
