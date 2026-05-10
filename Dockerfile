FROM ghcr.io/pterodactyl/yolks:nodejs_20

USER root

RUN apk update && apk add --no-cache \
    python3 \
    py3-pip \
    py3-virtualenv \
    php \
    php-cli \
    php-phar \
    php-openssl \
    php-mbstring \
    php-xml \
    php-curl \
    php-zip \
    php-gd \
    php-intl \
    php-bcmath \
    php-sqlite3 \
    php-mysqli \
    php-pdo \
    php-pdo_mysql \
    php-pdo_sqlite \
    unzip \
    git \
    curl \
    ca-certificates \
    bash \
    && ln -sf /usr/bin/python3 /usr/local/bin/python \
    && ln -sf /usr/bin/pip3 /usr/local/bin/pip \
    && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm /tmp/composer-setup.php

USER container

WORKDIR /home/container