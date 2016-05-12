#! /bin/bash

a=$1
b=$2

if test $# != 2;then
	echo "请填写 2 个参数！"
elif [ ! $a = $b ];then
	echo "$a 不等于 $b"
else
	echo "$a 等于 $b"
fi
