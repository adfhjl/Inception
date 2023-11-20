if [ -f "$HEALTHCHECK_FILE" ]; then
	rm "$HEALTHCHECK_FILE"
fi


{
	echo "FLUSH PRIVILEGES;"
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	# echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'vbenneko.42.fr' IDENTIFIED VIA mysql_native_password USING PASSWORD('$WP_DBPASS') WITH GRANT OPTION;"
	echo "CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY '$WP_DBPASS';"
	echo "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';"
	# echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	echo "FLUSH PRIVILEGES;"
} | mariadbd --bind-address="mariadb" --bootstrap

touch "$HEALTHCHECK_FILE"

exec $@
