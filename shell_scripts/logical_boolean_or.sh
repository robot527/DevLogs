#! /bin/bash

#if test $# = 1 || $# = 2;then   #logical or, error: command not found
#if [ $# = 1 ] || [ $# = 2 ];then
if [[ $# = 1 || $# = 2 ]];then
	echo "arg num is" $#
elif test $# = 3 -o $# = 4;then  #boolean or: -o
	echo "Arg num is $#"
else
	echo "arg num error !"
fi
