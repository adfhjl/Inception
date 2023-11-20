if [ -f "$HEALTHCHECK_FILE" ]; then
	rm "$HEALTHCHECK_FILE"
fi


{
	echo "FLUSH PRIVILEGES;"
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	echo "CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY '$WP_DBPASS';"
	echo "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';"
	echo "FLUSH PRIVILEGES;"
} | mariadbd --bind-address="mariadb" --bootstrap

touch "$HEALTHCHECK_FILE"

exec $@
