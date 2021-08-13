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

PRINT "Install Redis Repo\t"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$LOG
STAT_CHECK $?

PRINT "Install Repo\t\t"
yum install redis -y --enablerepo=remi &>>$LOG
STAT_CHECK $?

PRINT "Update Redis Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
STAT_CHECK $?

PRINT "Start Redis Service\t"
systemctl enable redis &>>$LOG && systemctl start redis &>>$LOG
STAT_CHECK $?