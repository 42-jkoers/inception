include .env
export $(shell sed 's/=.*//' .env)

up:
	docker-compose up --build -d --remove-orphans

down: preinstall
	docker-compose down -t 2

preinstall:
	sh ./srcs/preinstall.sh
	echo "127.0.0.1 $(LOGIN).42.fr" >> /etc/hosts
	touch preinstall
