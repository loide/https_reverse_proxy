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

#echo "Create SSL certificate.........................................."
#sudo mkdir /etc/nginx/ssl
#sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=BR/ST=AM/L=MAO/O=localdomain.com/CN=jenkins.localdomain"

#sudo mv default /etc/nginx/sites-available/.
