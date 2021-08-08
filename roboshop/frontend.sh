#!/bin/bash

echo -e "Installing Nginx\t\t...\t\e[32mdone\e[0m"
yum install nginx -y

echo "Enabling Nginx"
systemctl enable nginx

echo "Starting nginx"
systemctl start nginx
