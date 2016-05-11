#! /bin/bash

## line 6: test: ==: unary operator expected, when exec without arguments

#if test "$1" == "all" ##correct
if test $1 == "all"
then
	echo "arg1 is " $1
	#to do
else
	echo "hello shell!"
	#to do
fi
