FROM		alpine:3.12
LABEL		maintainer="robriard"



# GENERATING DEFAULT START FOLDER
WORKDIR		/app

# INSTALL NGINX AND OPENSSL
RUN			apk update && apk add --no-cache openssl && apk add --no-cache nginx



# COPY CONFIGURATION FILES AND RUN THE NECESSARIES COMMANDS
#		copy the configuration file for nginx and create a symbolic link
COPY		./srcs/nginx.conf /etc/nginx/http.d/default.conf
RUN			ln -fs /etc/nginx/http.d/default.conf /etc/nginx/conf.d/default.conf

#		create ssl certificate
RUN			openssl req -x509 -nodes							\
-subj '/C=FR/ST=PARIS/L=PARIS/O=robriard/CN=localhost'			\
-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl.key		\
-out /etc/ssl/certs/ssl.crt

RUN			mkdir -p /run/nginx 
#&& mkdir -p /var/www/nginx_index
#COPY		./srcs/index.html /var/www/nginx_index/index.html

# START SERVER
ENTRYPOINT ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["/bin/sh"]

#  EXPOSE PORT
EXPOSE	443
