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
    echo -e "\e[33m Check the log file for more details, Log file - $LOG"
    exit 1
  fi
}

PRINT () {
  echo -e "\n##################\t$1\t###################" &>>$LOG
  echo -n -e "$1\t\t..."
}

PRINT "Installing Nginx\t"
yum install nginx -y  &>>$LOG
STAT_CHECK $?

PRINT "Download frontend\t"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Remove Old HtDocs\t"
cd /usr/share/nginx/html &>>$LOG && rm -rf * &>>$LOG
STAT_CHECK $?

PRINT "Extract Frontend Archive"
unzip /tmp/frontend.zip &>>$LOG && mv frontend-main/* . &>>$LOG && mv static/* . &>>$LOG && rm -rf frontend-master static &>>$LOG
STAT_CHECK $?

PRINT "Update Roboshop Config\t"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG
STAT_CHECK $?

PRINT "Enabling Nginx\t\t"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT "Starting Nginx\t\t"
systemctl restart nginx &>>$LOG
STAT_CHECK $?

### 1. Output of commands should not be displayed on screen
### 2. Validate the command is successful or not
### 3. Need to validate whether the script running as root user or not.




