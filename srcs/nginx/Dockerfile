FROM debian:oldstable

RUN apt-get update && apt-get install -y nginx openssl

COPY config/ /tmp/nginx

RUN mkdir -p /var/www
RUN mv /tmp/nginx/index.html /var/www/index.html

RUN mv /tmp/nginx/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN rm -rf /etc/nginx/sites-enabled/*
RUN ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
EXPOSE 443
EXPOSE 80
# TODO: DELETE ^

RUN openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 3560 \
		-nodes \
		-out /etc/ssl/certs/localhost.crt \
		-keyout /etc/ssl/private/localhost.key \
		-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=YesMan/OU=Me/CN=www.localhost"

CMD ["nginx", "-g", "daemon off;"]
