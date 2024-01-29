FROM alpine:3.16

RUN apk update -y && apk add -y nginx && apk add openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MO/L=MED/O=1337/OU=student/CN=rarraji.42.fr/UID=rarraji"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE 443

CMD [ "nginx", "-g", "deamon off;" ]