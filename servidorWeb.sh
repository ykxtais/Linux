#!/bin/bash

echo "Atualizando servidor"
apt-get update
apt-get upgrade -y

echo "Instalando apache"
apt-get install apache2 unzip wget -y

echo "Baixando arquivo"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html/ 
