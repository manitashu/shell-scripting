#!/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -n -e "Installing Nginx\t\t..."
yum install nginx -y  >>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo fail
fi

echo -n -e "Enabling Nginx\t\t..."
systemctl enable nginx  >>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo fail
fi

echo -n -e "Starting Nginx\t\t..."
systemctl start nginx >>$LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo fail
fi

### 1. Output of commands should not be displayed on screen
### 2. Validate the command is successful or not
### 3. Need to validate whether the script running as root user or not.




