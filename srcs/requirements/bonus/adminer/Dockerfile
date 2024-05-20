FROM debian:bullseye

RUN apt-get update && apt-get install -y curl php php-fpm php-mysqli php-pdo php-pdo-mysql && rm -rf /var/lib/apt/lists/*

RUN curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN mkdir -p /var/www/html
RUN mv ./adminer-4.8.1.php /var/www/html/index.php

RUN mkdir -p /run/php
RUN chown www-data:www-data /run/php

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "--nodaemonize"]