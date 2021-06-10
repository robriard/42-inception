FROM		debian:buster
LABEL		maintainer="robriard"

# Update
RUN			apt update -y && apt -y upgrade -y

# Install php
RUN			apt install -y php7.3 php7.3-fpm php-mysqli

# Copy confile files
COPY			./srcs/wp_entrypoint.sh /wp_entrypoint.sh
COPY			./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN			mkdir -p /run/php	\
&&			chmod +x /wp_entrypoint.sh

WORKDIR			/var/www/html

# Start server
ENTRYPOINT		["/wp_entrypoint.sh"]

# Ports
EXPOSE			9000
