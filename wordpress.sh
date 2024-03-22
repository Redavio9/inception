#!/bin/sh

if [ ! -d "/var/www/html/wordpress" ]
then
    mkdir /var/www/html/wordpress 
fi
 
cd /var/www/html/wordpress && rm -rf *
 
# Download WordPress
echo "Downloading WordPress ..."
wp core download --allow-root

# this config for establishing a database connection ???
sed -i "s/username_here/${DB_USER}/g" wp-config-sample.php
sed -i "s/password_here/${DB_PASS}/g" wp-config-sample.php
sed -i "s/localhost/${DB_ROOT}/g" wp-config-sample.php
sed -i "s/database_name_here/${DB_NAME}/g" wp-config-sample.php
cp  wp-config-sample.php wp-config.php

# Install WordPress
echo "Installing WordPress ..."
wp core install --allow-root --url=${DOMAINE_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USR} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}
echo "Creating users..."
wp user create ${WP_USR} ${WP_EMAIL} --role=editor --user_pass=${WP_PWD} --path=/var/www/html/wordpress --allow-root

exec php-fpm7 -F
