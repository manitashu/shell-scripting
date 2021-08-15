#!/bin/bash

# while loop
# for loop

i=10
while [ $i -gt 0 ]; do
  echo iteration = $i
  i=$(($i-1))
done

i=0
while [ $1 -le 2 ]
do
  echo number : $i
  ((i++))
done