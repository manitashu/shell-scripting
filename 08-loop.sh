#!/bin/bash

# while loop

i=10
while [ $i -gt 0 ]; do
  echo iteration = $i
  i=$(($i-1))
done

# for loop

for fruit in apple banana orange kiwi mango ; do
  echo $fruit
done

# the above loop will iterate for 5 times as there are 5 values