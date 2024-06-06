FROM debian:bookworm

WORKDIR /var/www/html

RUN apt update
RUN apt install php-fpm php-mysql -y
RUN apt install curl -y
RUN apt install sendmail -y
RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

#install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./conf/wordpress.sh /wordpress.sh
ENTRYPOINT ["sh", "/wordpress.sh"]