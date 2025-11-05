FROM php:8.2-fpm
WORKDIR /var/www
RUN apt-get update && apt-get install -y libzip-dev unzip
RUN docker-php-ext-install pdo pdo_mysql zip
COPY . .
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader || true
EXPOSE 9000
CMD ["php-fpm"]