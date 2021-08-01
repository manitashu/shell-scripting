#!/usr/bin/bash

## Printing something on screen can be done by two commands
# 1. echo
# 2. printf

# printf command will have more syntaxes to deal with and however echo is more descriptive and yet does all the things that  printf does.

echo Hello World

## Syntax for color and new lines : echo -e "MESSAGE\n\t\e"
# echo -e option do need message to be quoted (either single or double quotes) | (without quotes also works but with more syntaxing)


# Print multiple lines (\n), some tab space (/t)

echo -e Hello World, \n\tWelcome

# Enable colors (\e)

#syntax : echo -e "\e[COLmMESSAGE"
# Colors and their codes are
# RED     31
# GREEN   32
# YELLOW  33
# BLUE    34
# MAGENTA 35
# CYAN    36

echo -e "\e[31mMESSAGE IN RED"
echo -e "\e[33mMESSAGE IN YELLOW"