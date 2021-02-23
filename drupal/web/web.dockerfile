FROM php:7.4-apache

ENV APACHE_DOCUMENT_ROOT=/var/www/html/
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

RUN apt-get update && apt-get install -y libzip-dev libpng-dev

# Extension mysql driver for mysql
RUN docker-php-ext-install pdo_mysql mysqli gd opcache

RUN a2enmod rewrite
RUN service apache2 restart

COPY ./my-php.ini /usr/local/etc/php/php.ini
COPY ./my-opcache.ini /usr/local/etc/php/conf.d/opcache.ini
# COPY ./my-apache2.conf /etc/apache2/apache2.conf
