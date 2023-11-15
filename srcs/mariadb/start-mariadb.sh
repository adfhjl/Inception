{
	echo "FLUSH PRIVILEGES;"
	echo "CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY '$WP_DBPASS';"
	echo "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%';"
	echo "FLUSH PRIVILEGES;"
} | mariadbd --bind-address="mariadb" --bootstrap

exec $@
