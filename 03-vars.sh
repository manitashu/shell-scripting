#!/usr/bin/bash

A=10
echo A = $A
DATE="14-07-21"
echo Welcome, today date is $DATE

## Command subs
N0_OF_USERS=$(who |wc -1)
echo Number of users = $N0_OF_USERS

## Date with command substitution
DATE=$(date +%F)
echo Welcome,today date is $DATE

