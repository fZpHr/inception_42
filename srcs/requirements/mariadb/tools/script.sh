#!/bin/bash

# Vérifie que toutes les variables d'environnement nécessaires sont définies
if [[ -z "$WP_DATABASE" ]]; then echo "Erreur : WP_DATABASE n'est pas défini."; exit 1; fi
if [[ -z "$WP_DB_USER" ]]; then echo "Erreur : WP_DB_USER n'est pas défini."; exit 1; fi
if [[ -z "$WP_DB_PWD" ]]; then echo "Erreur : WP_DB_PWD n'est pas défini."; exit 1; fi
if [[ -z "$MARIADB_ROOT_PASSWORD" ]]; then echo "Erreur : MARIADB_ROOT_PASSWORD n'est pas défini."; exit 1; fi

# Initialise le répertoire de données MariaDB
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Démarre MariaDB en mode bootstrap
mariadbd --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;

# Supprimez l'utilisateur et la base de données par défaut
DROP USER IF EXISTS ''@'localhost';
DROP DATABASE IF EXISTS test;

# Créez la base de données WordPress et l'utilisateur
CREATE DATABASE IF NOT EXISTS $WP_DATABASE;
CREATE USER IF NOT EXISTS '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PWD';
GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO '$WP_DB_USER'@'%';

# Changez le mot de passe de l'utilisateur root
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Exécute MariaDB
exec mariadbd