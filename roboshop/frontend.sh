#!/bin/bash

echo "Installing Nginx"
yum install nginx -y

echo "Enabling Nginx"
systemctl enable nginx

echo "Starting nginx"
systemctl start nginx
