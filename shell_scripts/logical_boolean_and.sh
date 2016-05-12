#! /bin/bash

#if test $# -ge 1 && $# -lt 2;then   #logical and, error: command not found
if [ $# -ge 1 ] && [ $# -lt 3 ];then #great or equal to 1, less than 3
#if [[ $# -ge 1 && $# -lt 3 ]];then  #also ok
	echo "arg num is" $#
elif test $# -ge 3 -a $# -lt 5;then  #boolean and: -a
	echo "Arg num is $#"
else
	echo "arg num error !"
fi
