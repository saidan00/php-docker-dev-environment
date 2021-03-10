FROM php:7.3-fpm

RUN apt-get update && apt-get install -y libzip-dev libpng-dev libicu-dev

# Extension zip for laravel
RUN docker-php-ext-install zip pdo_mysql mysqli gd exif fileinfo intl

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# RUN composer global require laravel/installer

COPY ./my-php.ini /usr/local/etc/php/php.ini