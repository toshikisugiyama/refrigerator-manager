FROM php:7.4-fpm
WORKDIR /var/www/html/refrigerator_manager
COPY --from=node:12 /usr/local/bin /usr/bin
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN apt-get update \
  && apt-get install -y wget git zip unzip vim libpq-dev \
  && : 'Install PHP Extensions' \
  && docker-php-ext-install pdo_mysql pdo_pgsql
