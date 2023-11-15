FROM debian:oldstable

RUN apt-get update && apt-get install -y mariadb-server
RUN mkdir -p /var/run/mysqld; \
	chmod 777 /var/run/mysqld /var/lib/mysql;

COPY start-mariadb.sh /home/start-mariadb.sh
EXPOSE 3306

CMD ["mariadbd", "--bind-address=mariadb"]
ENTRYPOINT ["sh", "/home/start-mariadb.sh"]
