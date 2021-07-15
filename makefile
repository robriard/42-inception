# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: robriard <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 11:41:07 by robriard          #+#    #+#              #
#    Updated: 2021/06/23 19:27:07 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


up:
	docker-compose -f srcs/docker-compose.yaml up

all: up

re:
	docker-compose -f srcs/docker-compose.yaml up --build

down:
	docker-compose -f srcs/docker-compose.yaml down

ps:
	docker-compose -f srcs/docker-compose.yaml ps

rm: down
	docker system prune -a

.PHONY:	up down re ps rm
