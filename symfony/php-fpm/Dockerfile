FROM php:7.4-fpm-alpine

RUN apk --update --no-cache add git bash postgresql-dev

RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

RUN wget https://get.symfony.com/cli/installer -O - | bash

CMD composer install ; wait-for-it database:3306 -- bin/console doctrine:migrations:migrate ;  php-fpm

EXPOSE 9000
