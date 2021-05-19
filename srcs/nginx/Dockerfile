FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y

RUN apt-get install nginx -y

WORKDIR /tmp/src/

COPY src/ /tmp/src/

RUN chmod 770 mkcert-v1.4.3-linux-amd64 && \
	./mkcert-v1.4.3-linux-amd64 -install && \
	./mkcert-v1.4.3-linux-amd64 localhost && \
	mkdir -p /etc/nginx/ssl/ && \
	mv localhost.pem /etc/nginx/ssl/ && \
	mv localhost-key.pem /etc/nginx/ssl/ && \
	chmod -R 770 /etc/nginx/ssl/

RUN rm -rf /etc/nginx/sites-enabled/* && \
	mv nginx.conf /etc/nginx/sites-available/nginx.conf && \
	ln -fs /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ && \
	nginx -t

RUN mv index.html /var/www/

EXPOSE 443

ENTRYPOINT [ "nginx" ]
CMD ["-g", "daemon off;"]
