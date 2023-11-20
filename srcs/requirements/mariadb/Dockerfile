FROM debian:oldstable

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld; \
	chmod 777 /var/run/mysqld /var/lib/mysql;

COPY tools/start-mariadb.sh /home/start-mariadb.sh

RUN sed 's/bind-address .*/bind-address = mariadb/' -i /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mysql_install_db -datadir=/var/lib/mysql --user=mysql
EXPOSE 3306

ENV HEALTHCHECK_FILE=/usr/health

HEALTHCHECK --interval=1s --retries=20 \
	CMD test -e "$HEALTHCHECK_FILE"

CMD ["mariadbd", "--bind-address=mariadb"]
ENTRYPOINT ["sh", "/home/start-mariadb.sh"]
