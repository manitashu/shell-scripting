#!/bin/bash

source common.sh

PRINT "Install NodeJS\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add Roboshop Application User"
id roboshop &>>$LOG
if [ $? -ne 0 ]; then
  useradd roboshop &>>$LOG
fi
STAT_CHECK $?

