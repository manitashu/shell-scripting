#!/bin/bash

# while loop
# for loop

i=10
while [ $i -gt 0 ]; do
  echo iteration = $i
  i=$(($i-1))
done