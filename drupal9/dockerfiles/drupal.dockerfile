FROM drupal:9-fpm-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer