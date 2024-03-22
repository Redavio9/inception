#!/bin/sh

# Ensure the WordPress directory exists
if [ ! -d "/var/www/html/wordpress" ]; then
    mkdir -p /var/www/html/wordpress
fi

# Cleanup existing files in the WordPress directory
cd /var/www/html/wordpress && rm -rf *

# Download WordPress
echo "Downloading WordPress ..."
wp core download --allow-root

# Configure database connection in wp-config.php
wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" --dbhost="${MYSQL_USR}" --allow-root
#cp wp-config.php wp-config-sample.php
cp wp-config-sample.php wp-config.php

# Install WordPress
echo "Installing WordPress ..."
wp core install --allow-root --url="${DOMAIN_NAME}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USR}" --admin_password="${WP_ADMIN_PWD}" --admin_email="${WP_ADMIN_EMAIL}"

# Create additional user
echo "Creating additional user..."
wp user create "${WP_USR}" "${WP_EMAIL}" --role=editor --user_pass="${WP_PWD}" --path=/var/www/html/wordpress --allow-root

echo "DONE"
exec php-fpm -F
