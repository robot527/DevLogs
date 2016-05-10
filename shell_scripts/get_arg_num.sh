#! /bin/bash

#if test $# != 0
#if test "$#" != 0
if [ $# != 0 ];
then
	echo "arg num is" $#
else
	echo "no argment !"
fi
