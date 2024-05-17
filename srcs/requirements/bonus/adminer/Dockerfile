FROM debian:bullseye

# Install PHP-FPM, PHP MySQLi, curl, and PHP Redis
RUN apt update && apt install -y php7.4-fpm php7.4-mysqli curl php-redis


COPY tools/index.html /var/lib/nginx/html/.
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
# Copy PHP-FPM configuration file
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

# Install Nginx
RUN apt install -y nginx

# Copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copy Adminer to the web directory
COPY conf/adminer-4.8.1.php /var/www/html/adminer.php

# Start Nginx and PHP-FPM
CMD service nginx start && service php7.4-fpm start
