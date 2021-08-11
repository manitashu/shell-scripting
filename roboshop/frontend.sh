#!/bin/bash

source common.sh

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




