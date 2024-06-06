#!/bin/sh
if [ ! -d "/var/www/html/wordpress" ]
then
    mkdir /var/www/html/wordpress
fi
cd /var/www/html/wordpress && rm -rf *
chmod -R 777 /var/www/html/wordpress

wp core download --allow-root

wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${LOCALH} --allow-root --skip-check

wp core install --allow-root --url=${DOMAINE_NAME} --title=${LOGO} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}

wp user create ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASS} --path=/var/www/html/wordpress --allow-root

exec php-fpm8.2 -F