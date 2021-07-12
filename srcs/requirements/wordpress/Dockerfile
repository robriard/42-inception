FROM		debian:buster
LABEL		maintainer="robriard"

# Update
RUN			apt update -y && apt -y upgrade -y

# Install php
RUN			apt install -y php7.3 php7.3-fpm php-mysqli wget
RUN			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN			chmod +x wp-cli.phar
RUN			mv wp-cli.phar /usr/local/bin/wp

# Copy confile files
COPY			./srcs/wp_entrypoint.sh /wp_entrypoint.sh
COPY			./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN			mkdir -p /run/php	\
&&			chmod +x /wp_entrypoint.sh

WORKDIR			/var/www/html

# Start server
ENTRYPOINT		["/wp_entrypoint.sh"]
RUN			echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

# Ports
EXPOSE			9000
