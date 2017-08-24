FROM php:7.1-fpm-alpine

MAINTAINER Ricky Delorier <rdelorier@gmail.com>

RUN apk --no-cache add \
    libmcrypt-dev \
    icu-dev \
 && docker-php-ext-install \
    intl \
    mcrypt \
    pdo \
    pdo_mysql

WORKDIR /var/www
