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

PRINT "Setting up Repository\t"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
# shellcheck disable=SC2261
# shellcheck disable=SC2261
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT_CHECK $?

PRINT "Install MongoDB\t\t"
yum install -y mongodb-org &>>$LOG
STAT_CHECK $?

PRINT "Update MongoDB Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongodb.conf
STAT_CHECK $?

PRINT "Start MongoDB service\t"
systemctl enable mongod &>>$LOG && systemctl start mongod &>>$LOG
STAT_CHECK $?

PRINT "Download MongoDB schema\t"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Load schema\t\t"
cd /tmp &>>$LOG && unzip -o mongodb.zip &>>$LOG && cd mongodb-main &>>$LOG && mongo < catalogue.js &>>$LOG && mongo < users.js &>>$LOG
STAT_CHECK $?