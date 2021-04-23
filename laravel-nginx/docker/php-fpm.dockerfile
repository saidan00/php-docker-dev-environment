FROM php:7.4-fpm-alpine

RUN apk --update --no-cache add libzip-dev

# Extension zip for laravel
RUN docker-php-ext-install zip pdo_mysql mysqli

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
