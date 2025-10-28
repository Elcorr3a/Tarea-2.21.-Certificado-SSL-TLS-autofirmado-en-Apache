#!/bin/bash
set -e

sudo apt update
sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql -y

sudo systemctl enable apache2
sudo systemctl enable mysql
sudo systemctl start apache2
sudo systemctl start mysql

echo "LAMP instalado y servicios iniciados correctamente"
