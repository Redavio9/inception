FROM debian:bookworm

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install nginx -y \
    && apt install openssl -y \
    && mkdir -p /etc/nginx/ssl

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/html
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=/L=/O=/OU=/CN=rarraji.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]