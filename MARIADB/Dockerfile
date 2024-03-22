FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install mariadb-server -y

# Set permissions on directories
RUN mkdir -p /run/mysqld && chown -R mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql /var/lib/mysql

# Install MariaDB
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

EXPOSE 3306


# COPY ./conf/create_DB.sh /config.sh

# ENTRYPOINT ["sh", "/config.sh"]
COPY ./conf/create_DB.sh /docker-entrypoint-initdb.d/

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]
