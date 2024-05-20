#!/bin/bash

# Vérifiez que toutes les variables d'environnement nécessaires sont définies
if [[ -z "$FTP_USER" ]]; then echo "Erreur : FTP_USER n'est pas défini."; exit 1; fi
if [[ -z "$FTP_PASSWORD" ]]; then echo "Erreur : FTP_PASSWORD n'est pas défini."; exit 1; fi

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    # Créez le répertoire home de l'utilisateur FTP
    mkdir -p /var/www/html

    # Remplacez le fichier de configuration de vsftpd par le mien
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

    # Créez l'utilisateur FTP
    yes "" | adduser $FTP_USER --disabled-password

    # Définissez le mot de passe de l'utilisateur FTP
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

    # Donnez à l'utilisateur FTP la propriété de son répertoire home
    chown -R $FTP_USER:$FTP_USER /var/www/html

    # Ajoutez l'utilisateur à la liste des utilisateurs de vsftpd
    echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

fi

vsftpd /etc/vsftpd/vsftpd.conf