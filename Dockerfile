FROM node:20-bookworm-slim

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    php-cli \
    php-common \
    php-mbstring \
    php-xml \
    php-curl \
    php-zip \
    php-gd \
    php-intl \
    php-bcmath \
    php-sqlite3 \
    php-mysql \
    unzip \
    git \
    curl \
    ca-certificates \
    bash \
    tar \
    jq \
    && ln -sf /usr/bin/python3 /usr/local/bin/python \
    && ln -sf /usr/bin/pip3 /usr/local/bin/pip \
    && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm /tmp/composer-setup.php \
    && useradd -m -d /home/container -s /bin/bash container \
    && chown -R container:container /home/container \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER container

ENV USER=container
ENV HOME=/home/container

WORKDIR /home/container