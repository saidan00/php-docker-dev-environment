FROM php:7.4-apache

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

COPY ./my-php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y libzip-dev
RUN pecl install xdebug

# Extension mysql driver for mysql
RUN docker-php-ext-install pdo_mysql mysqli
RUN docker-php-ext-enable xdebug
RUN echo "\n\
  xdebug.client_host=172.17.0.1 \n\
  xdebug.idekey=VSCODE \n\
  xdebug.default_enable=1 \n\
  xdebug.discover_client_host=0 \n\
  xdebug.remote_handler=dbgp \n\
  xdebug.remote_port=9000 \n\
  xdebug.mode=debug \n\
  xdebug.start_with_request=yes \n\
  xdebug.client_port = 9000 \n\
  " >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
