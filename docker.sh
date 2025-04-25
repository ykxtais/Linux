#!/bin/bash

echo "Instalando apache e mysql"
apt install mysql-server apache2 -y

echo "Iniciando mysql"
systemctl start mysql

echo "Criando database e tabela no mysql"
mysql -u root -p -e "
create database projdocker;
use projdocker;
create table Dados (
    AlunoID int,
    Nome varchar(50),
    Sobrenome varchar(50),
    Endereco varchar(100),
    Cidade varchar(50),
    Host varchar(50)
);"

echo "php via docker"

wget https://github.com/denilsonbonatti/toshiro-shibakita/archive/refs/heads/main.zip
unzip main.zip

cd toshiro-shibakita-main

docker run --name toserver -dt -p 80:80 --mount type=volume,src=app,dst=/app webdevops/php-apache:alpine-php7
