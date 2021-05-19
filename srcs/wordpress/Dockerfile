FROM debian:buster

WORKDIR /tmp/wordpress/

COPY src/ /tmp/wordpress/

RUN apt-get update && \
	apt-get upgrade -y

RUN apt-get install -y php-fpm

RUN mkdir -p /var/www/wordpress/ && \
	tar xzf latest.tar.gz --directory /var/www/ && \
	mv wp-config.php /var/www/wordpress/ && \
	mv index.php /var/www/

# RUN chmod 777 wp-cli.phar && \
# 	mv wp-cli.phar /usr/local/bin/wp-cli && \
# 	wp-cli update

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
