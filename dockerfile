FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt update && apt upgrade -y
RUN apt install -y libzip-dev unzip zip git mariadb-client
RUN docker-php-ext-install pdo pdo_mysql zip

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY . .

CMD ["php-fpm"]
