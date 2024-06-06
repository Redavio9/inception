FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install mariadb-server -y
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
RUN chmod -R 777 /var/lib/mysql

RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql 

EXPOSE 3306

COPY ./conf/Script_DB.sh /Script_DB.sh
RUN chmod +x config.sh
ENTRYPOINT ["sh", "Script_DB.sh"]

CMD ["mariadbd", "--user=root", "--bind-address=0.0.0.0"]