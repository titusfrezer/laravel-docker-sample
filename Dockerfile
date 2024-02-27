FROM php:8.2-fpm

WORKDIR /var/www/laravel-docker-sample

RUN apt-get update && apt-get install -y \
        libzip-dev \
        unzip \
        && docker-php-ext-install pdo_mysql zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY --chown=www:www . /var/www/laravel-docker-sample

RUN chmod -R 755 /var/www/laravel-docker-sample/storage /var/www/laravel-docker-sample/bootstrap/cache

RUN composer install

EXPOSE 9000

CMD ["php-fpm"]