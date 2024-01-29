FROM alpine:3.16

RUN apk update -y && apk add -y nginx && apk add openssl -y
RUN mkdir -p /etc/nginx/ssl

EXPOSE 443

CMD [ "nginx", "-g", "deamon off;" ]

