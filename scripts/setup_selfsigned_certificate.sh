#!/bin/bash
set -e
source .env

sudo mkdir -p /etc/ssl/certs /etc/ssl/private

sudo openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout $SSL_KEY_FILE \
  -out $SSL_CERT_FILE \
  -subj "/C=$OPENSSL_COUNTRY/ST=$OPENSSL_PROVINCE/L=$OPENSSL_LOCALITY/O=$OPENSSL_ORGANIZATION/OU=$OPENSSL_ORGUNIT/CN=$OPENSSL_COMMON_NAME/emailAddress=$OPENSSL_EMAIL"

sudo a2enmod ssl
sudo a2ensite default-ssl.conf
sudo systemctl reload apache2

echo "Certificado SSL creado y Apache recargado correctamente"
