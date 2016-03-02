#!/bin/bash

echo "Installing openjdk-7-jre and openjdk-7-jdk....................."
sudo apt-get update
sudo apt-get install -y openjdk-7-jre 
sudo apt-get install -y openjdk-7-jdk

echo "Add the Jenkins key and source list to apt....................."
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -

echo "Create sources list for Jenkins..................."
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update

echo "Installing Jenkins...................."
sudo apt-get install -y jenkins

echo "Updating package list and installing nginx............................"
sudo apt-get update
sudo apt-get install -y nginx

echo "Create SSL certificate.........................................."
sudo mkdir -p /etc/nginx/ssl/jenkins.domain.com
country="BR"
state="AM"
locality="Manaus"
organization="verdes.net"
organizationalunit="IT"
email="admin@verdes.net"
commonname="jenkins.domain.com"
path="/etc/nginx/ssl/jenkins.domain.com" #path to save keys
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $path/server.key -out $path/server.crt -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname"

sudo mv jenkins /etc/nginx/sites-available/.
sudo ln -s -f /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo service nginx restart
