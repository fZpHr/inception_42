#!/bin/bash

if [[ -z "$WP_DATABASE" ]]; then echo "Erreur : WP_DATABASE n'est pas défini."; exit 1; fi
if [[ -z "$WP_DB_USER" ]]; then echo "Erreur : WP_DB_USER n'est pas défini."; exit 1; fi
if [[ -z "$WP_DB_PWD" ]]; then echo "Erreur : WP_DB_PWD n'est pas défini."; exit 1; fi
if [[ -z "$WP_URL" ]]; then echo "Erreur : WP_URL n'est pas défini."; exit 1; fi
if [[ -z "$TITLE" ]]; then echo "Erreur : WP_TITLE n'est pas défini."; exit 1; fi
if [[ -z "$WP_ADMIN_USER" ]]; then echo "Erreur : WP_ADMIN_NAME n'est pas défini."; exit 1; fi
if [[ -z "$WP_ADMIN_PWD" ]]; then echo "Erreur : WP_ADMIN_PASSWORD n'est pas défini."; exit 1; fi
if [[ -z "$WP_ADMIN_EMAIL" ]]; then echo "Erreur : WP_ADMIN_EMAIL n'est pas défini."; exit 1; fi


cd /var/www/html

# Vérifier si WordPress est déjà installé
if ! [ -e wp-config.php ]; then
    # Télécharger et configurer WordPress
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname=$WP_DATABASE --dbuser=$WP_DB_USER --dbpass=$WP_DB_PWD --dbhost=mariadb --allow-root
    ./wp-cli.phar core install --url=$WP_URL --title=$TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
    ./wp-cli.phar user create $WP_USER $WP_EMAIL --role=subscriber --user_pass=$WP_PASSWORD --allow-root

    chmod -R 775 wp-content
fi


## redis ##
./wp-cli.phar config set WP_REDIS_HOST redis --allow-root
./wp-cli.phar config set WP_REDIS_PORT 6379 --raw --allow-root
./wp-cli.phar config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
./wp-cli.phar config set WP_REDIS_CLIENT phpredis --allow-root
./wp-cli.phar plugin install redis-cache --activate --allow-root
./wp-cli.phar plugin update --all --allow-root
./wp-cli.phar redis enable --allow-root

mkdir -p /run/php/
chmod 775 wp-content/object-cache.php
# Exécuter php-fpm
php-fpm7.4 -F