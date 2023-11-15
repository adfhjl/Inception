FROM debian:oldstable

RUN apt-get update && apt-get install -y unzip php php-mysql mariadb-client php-fpm
RUN mkdir -p /var/php /var/run/php; \
	chmod 777 /var/php;

COPY wp-config.php /tmp/wordpress/wp-config.php
COPY wordpress.zip /tmp/wordpress.zip
RUN unzip /tmp/wordpress.zip -d /var/www/
COPY wp-cli.phar /home/wp-cli.phar
COPY start-wp.sh /home/start-wp.sh
EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
ENTRYPOINT ["sh", "/home/start-wp.sh"]
