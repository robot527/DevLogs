#! /bin/bash
# author: robot527

if [ $# == 1 ];then
	numofchar=$1
else
	numofchar=6
fi

#1.使用 /dev/urandom 和 strings, tr, head, sed 等工具生成指定长度的随机字符串
# 可打印字符
randstr=$(strings -a /dev/urandom | tr -d '\n' | head -c $numofchar)
echo $numofchar "printable characters:"
echo $randstr
echo

# 字母加数字
randstr=$(strings -a /dev/urandom | sed 's/[^a-zA-Z0-9]//g' | tr -d '\n' | head -c $numofchar)
echo $numofchar "alphanumeric characters:"
echo $randstr
