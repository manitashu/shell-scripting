#!/bin/bash

source /home/centos/shell-scripting/roboshop/common.sh

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

PRINT "Copy Roboshop Config\t"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG
STAT_CHECK $?

PRINT "Update Roboshop Config\t"
sed -i -e '/catalogue/ s/localhost/catalogue.roboshop.internal/' -e '/user/ s/localhost/user.roboshop.internal/' -e '/cart/ s/localhost/cart.roboshop.internal/' -e '/shipping/ s/localhost/shipping.roboshop.internal/' -e '/payment/ s/localhost/payment.roboshop.internal/' /etc/nginx/default.d/roboshop.conf
STAT_CHECK $?

PRINT "Enabling Nginx\t\t"
systemctl enable nginx &>>$LOG
STAT_CHECK $?

PRINT "Starting Nginx\t\t"
systemctl restart nginx &>>$LOG
STAT_CHECK $?

# 1. Output of commands should not be displayed on screen
# 2. Validate the command is successful or not
# 3. Need to validate whether the script running as root user or not.




