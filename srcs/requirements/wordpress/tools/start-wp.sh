alias wp="php /home/wp-cli.phar --allow-root --path=/var/www"

rm -fr /var/www/html

# tail -f
if [ ! -f "/var/www/wp-config.php" ]
then
unzip /tmp/wordpress.zip -d /var/www
mv /var/www/wordpress/* /var/www/
rm -fr /var/www/wordpress
cp /tmp/wp-config.php /var/www/wp-config.php
fi

echo "Running 'wp core install'"
wp core install \
	--url="https://vbenneko.42.fr" \
	--title="Inception" \
	--admin_user="$WP_ADMIN_USER" \
	--admin_password="$WP_ADMIN_PASSWORD" \
	--admin_email="$WP_ADMIN_EMAIL" \
	--skip-email

wp user create "$WP_USER_NAME" "$WP_USER_EMAIL" --role=contributor --user_pass="$WP_USER_PASSWORD"

exec $@
