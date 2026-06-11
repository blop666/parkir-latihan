FROM php:8.2-fpm

WORKDIR /var/www/html

RUN apt upgrade && apt update -y
RUN apt-get install -y libzip-dev mariadb-client unzip zip git
RUN docker-php-ext-install pdo pdo_mysql zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY . .

CMD [ "php-fpm" ]