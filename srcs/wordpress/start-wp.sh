alias wp="php /home/wp-cli.phar --allow-root --path=/var/www/wordpress"

echo "Running 'wp config create'"
wp config create \
	--dbhost="$DB_HOST" \
	--dbname="$DB_NAME" \
	--dbuser="$WP_DBUSER" \
	--dbpass="$WP_DBPASS"
if [ ! $? -eq 0 ]
then
return 1
fi

echo "Running 'wp db create'"
wp db create

echo "Running 'wp core install'"
wp core install \
	--url="https://vbenneko.42.fr" \
	--title="Inception" \
	--admin_user="$WP_ADMIN_USER" \
	--admin_password="$WP_ADMIN_PASSWORD" \
	--admin_email="$WP_ADMIN_EMAIL" \
	--skip-email

exec $@
