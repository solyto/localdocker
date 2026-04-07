FROM php:8.4-fpm

WORKDIR /var/www

RUN chown -R www-data:www-data /var/www/

RUN apt update && apt install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    libsodium-dev \
    zip \
    unzip \
    libzip-dev \
    vim \
    mariadb-client \
    libpq-dev \
    libmagickwand-dev --no-install-recommends

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd intl sodium zip

RUN pecl install redis imagick
RUN docker-php-ext-enable redis imagick

RUN rm -rf /var/www/*

COPY ./api/ /var/www
RUN rm /var/www/bootstrap/cache/*

RUN composer install --optimize-autoloader
