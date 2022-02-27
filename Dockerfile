FROM php:8.0.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git unzip

RUN pecl install xdebug && docker-php-ext-enable xdebug
# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www
