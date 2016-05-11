#! /bin/bash

## line 5: test: ==: unary operator expected, when exec without arguments

if [ $1 == "all" ];then
#if [[ $1 == "all" ]];then ##correct
#if [ "$1" == "all" ];then ##correct
	echo "arg1 is $1"
	#to do
else
	echo "hello shell!"
	#to do
fi
