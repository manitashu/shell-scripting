#!/bin/bash

echo -e "Installing Nginx\t\t...\t\e[32mdone\e[0m"
yum install nginx -y
### 1. Output of commands should not be displayed on screen
### 2. Validate the command is successful or not

echo "Enabling Nginx"
systemctl enable nginx

echo "Starting nginx"
systemctl start nginx
