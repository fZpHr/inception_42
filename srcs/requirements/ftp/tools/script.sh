#!/bin/bash

# Vérifiez que toutes les variables d'environnement nécessaires sont définies
if [[ -z "$FTP_USER" ]]; then echo "Erreur : FTP_USER n'est pas défini."; exit 1; fi
if [[ -z "$FTP_PASSWORD" ]]; then echo "Erreur : FTP_PASSWORD n'est pas défini."; exit 1; fi

# Créez l'utilisateur FTP
useradd $FTP_USER -s /sbin/nologin

# Définissez le mot de passe de l'utilisateur FTP
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

# Créez le répertoire home de l'utilisateur FTP
mkdir -p /home/$FTP_USER/ftp
chown nobody:nogroup /home/$FTP_USER/ftp

# Donnez à l'utilisateur FTP la propriété de son répertoire home
mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

# Configurez les permissions du répertoire home de l'utilisateur FTP
chmod a-w /home/$FTP_USER/ftp

vsftpd /etc/vsftpd/vsftpd.conf