#!/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing Nginx\t\t...\t\e[32mdone\e[0m"
yum install nginx -y  >>/$LOG

### 1. Output of commands should not be displayed on screen
### 2. Validate the command is successful or not

echo "Enabling Nginx"
systemctl enable nginx  >>/$LOG

echo "Starting nginx"
systemctl start nginx >>/$LOG



