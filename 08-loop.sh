#!/bin/bash

# while loop
# for loop

i=0
while [ $1 -le 2 ]; do
  echo number = $i
  ((i++))
done