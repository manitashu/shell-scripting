#!/usr/bin/bash

## Declare a function

Sample() {
  echo Hello, I am Sample function
  echo value of a = ${a}
  b=200
  echo First Argument in Functions = $1
}
## Main Program

## Call the function
a=100
sample
echo value of b = ${b}
echo First Argument in the main program = $1
