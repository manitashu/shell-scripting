#!/bin/bash

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[31mYou should be root user/sudo user to run this script\e[0m"
  exit 2
fi

LOG=/tmp/roboshop.log
rm -f $LOG

STAT_CHECK() {
  if [ "$1" -eq 0 ]; then
    echo -e "\e[32m done\e[0m"
  else
    echo -e "\e[31m fail\e[0m"
    exit 1
  fi
}

PRINT () {
  echo -n -e "$1\t\t..."
}

PRINT "Installing Nginx"
yum install nginx -y  >>$LOG
STAT_CHECK $?

PRINT "Enabling Nginx"
systemctl enable nginx  >>$LOG
STAT_CHECK $?

PRINT "Starting Nginx"
systemctl start nginx >>$LOG
STAT_CHECK $?

### 1. Output of commands should not be displayed on screen
### 2. Validate the command is successful or not
### 3. Need to validate whether the script running as root user or not.




