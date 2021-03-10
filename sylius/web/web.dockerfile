FROM php:7.3-apache

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN apt-get update && apt-get install -y libzip-dev libpng-dev libicu-dev gnupg2 libjpeg-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN docker-php-ext-configure gd \
  --with-jpeg-dir=/usr/include/ 

# Extension mysql driver for mysql
RUN docker-php-ext-install pdo_mysql mysqli gd exif fileinfo intl

COPY ./my-php.ini /usr/local/etc/php/php.ini
