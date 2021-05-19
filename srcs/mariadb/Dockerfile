FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y

WORKDIR /tmp/mariadb/
COPY src/ /tmp/mariadb/

RUN apt-get install mariadb-server -y

RUN service mysql start && \
	mariadb -u root < /tmp/mariadb/setup.sql

# ENTRYPOINT [ "/bin/sh" ]
ENTRYPOINT [ "mariadb" ]
