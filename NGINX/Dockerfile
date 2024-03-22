# Utilisez l'image de base Alpine Linux
FROM debian:buster

# Installer NGINX
RUN apt update && apt install nginx -y && apt install openssl -y

# créer un dossier, qui permettra de stocker le certificat
RUN mkdir -p /etc/nginx/ssl

# install certificat TSL
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=1337/OU=1337/CN=rarraji.42.fr/UID=rarraji"

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Copier le fichier de configuration NGINX
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Exposer le port 443
EXPOSE 443

# Démarrer NGINX en arrière-plan
CMD ["nginx", "-g", "daemon off;"] 