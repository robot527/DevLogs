#! /bin/bash

n=0
echo "n = $n"

(( n += 1 ))  #Increment 1.  # (( $n += 1 )) is incorrect!
echo "n = $n"

let m=m+3     #Initial value of m is 0.
echo "m = $m"

let "m += 2"  #Quotes permit the use of spaces in variable assignment expression.
echo "m = $m"

let "m -= 4"
echo "m = $m"
