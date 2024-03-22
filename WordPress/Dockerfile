#FROM debian:buster
#
#RUN apt-get update && apt-get -y install \
#	wget \
#	curl \
#	bash \
#	php \
#	php-cgi \
#	php-mysql \
#	php-fpm \
#	php-pdo \
#	php-gd php-cli \
#	php-mbstring \
#	redis \
#	php-redis \
#	&& rm -rf /var/lib/apt/lists/*
#
## I need to install wp_cli command and put it in the right directory /usr/local/bin
#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#  && chmod +x wp-cli.phar \
#  && mv wp-cli.phar /usr/local/bin/wp
#
## Copy the .conf in the html directory
#COPY ./WordPress/tools/php.sh /etc/php/7.3/fpm/pool.d/
#
##Create the folder to enable php start
#RUN mkdir /run/php
#
##we copy the script, give the right to launch it in local on our computer
#COPY ./WordPress/conf/wordpress1.sh /wordpress.sh
#RUN chmod 777 /wordpress.sh
#ENTRYPOINT ["/wordpress.sh"]
#
##We go the html directory
#WORKDIR /var/www/html/
#
##We expose the 9000 port
#EXPOSE 9000
#
##Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
#CMD ["/usr/sbin/php-fpm7.3", "-Fi"]
FROM alpine:3.14

# Set the working directory to /var/www
WORKDIR /var/www/html

# Install necessary packages
RUN apk update && \
    apk --no-cache add \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-json \
    php7-openssl \
    php7-curl \
    php7-zlib \
    php7-xml \
    php7-phar \
    php7-intl \
    php7-dom \
    php7-xmlreader \
    php7-xmlwriter \
    php7-simplexml \
    php7-tokenizer \
    php7-ctype \
    php7-session \
    php7-mbstring \
    wget \
    curl \
    tar \
    && sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php7/php-fpm.d/www.conf

#install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp

# Expose port 9000 for php-fpm
EXPOSE 9000

COPY ./conf/wordpress.sh /config.sh

ENTRYPOINT ["sh", "/config.sh"]
