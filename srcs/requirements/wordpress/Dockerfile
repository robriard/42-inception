FROM		debian:buster
LABEL		maintainer="anclarma"

# Update
RUN			apt update -y > /dev/null && apt -y upgrade -y > /dev/null

# Install php
RUN			apt install -y php7.3 php7.3-fpm php-mysqli > /dev/null

# Copy confile files
RUN			mkdir -p /run/php
COPY		./srcs/wp_entrypoint.sh /wp_entrypoint.sh
RUN			chmod +x /wp_entrypoint.sh
COPY		./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR		/var/www/html

# Start server
ENTRYPOINT	["/wp_entrypoint.sh"]

# Ports
EXPOSE		9000
