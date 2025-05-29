FROM php:8.1-apache

RUN apt-get update && \
    apt-get install -y libsqlite3-dev && \
    docker-php-ext-install pdo pdo_sqlite

COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

RUN a2enmod rewrite
WORKDIR /var/www/html
EXPOSE 80