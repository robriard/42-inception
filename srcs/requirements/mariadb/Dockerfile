FROM		debian:buster
LABEL		maintainer="robriard"

RUN		apt-get update -y && apt-get upgrade -y && apt-get -y install mariadb-server

COPY		./srcs/entrypoint.sh .
RUN		chmod +x entrypoint.sh

EXPOSE		3306
RUN		mkdir -p /var/run/mysqld
RUN		rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY		./srcs/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT	["/bin/sh", "entrypoint.sh"]
