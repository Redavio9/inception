#!/bin/bash

echo "USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER ${DB_USER} @'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER} @'%';
FLUSH PRIVILEGES; " > databasee;
mariadbd --user=root --bootstrap < databasee

exec "$@"