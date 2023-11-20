FROM debian:oldstable

RUN apt-get update && apt-get install -y unzip php php-mysql mariadb-client php-fpm
RUN mkdir -p /var/php /var/run/php; \
	chmod 777 /var/php;

COPY config/wp-config.php /tmp/wp-config.php
COPY tools/wordpress.zip /tmp/wordpress.zip

COPY tools/wp-cli.phar /home/wp-cli.phar
COPY tools/start-wp.sh /home/start-wp.sh

RUN sed 's/listen = .*/listen = wordpress:9000/' -i /etc/php/7.4/fpm/pool.d/www.conf
RUN sed 's/;clear_env = no/clear_env = no/' -i /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
ENTRYPOINT ["sh", "/home/start-wp.sh"]
