FROM drupal:9-fpm-alpine

RUN apk --update --no-cache add git

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require drupal/coder drush/drush
RUN composer global require dealerdirect/phpcodesniffer-composer-installer

ENV PATH="${PATH}:/root/.composer/vendor/bin"
RUN phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer
