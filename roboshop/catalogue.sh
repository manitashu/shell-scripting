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

PRINT "Install NodeJS\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add Roboshop Application User"
id roboshop &>>$LOG
if [ $? -ne 0 ]; then
  useradd roboshop &>>$LOG
fi
STAT_CHECK $?

PRINT "Download Application Code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Extract Downloaded Code"
cd /home/roboshop && unzip -o /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue && cd /home/roboshop/catalogue && npm install
STAT_CHECK $?

# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue
