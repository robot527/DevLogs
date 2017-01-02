#! /bin/bash

# 测试字符串包含关系，即一个字符串是否是另一个字符串的子串。

# 使用字符串替换
function substr
{
	STRING_A=$1
	STRING_B=$2

	if [[ ${STRING_A/${STRING_B}//} == $STRING_A ]]
	then
		echo "\"$STRING_B\" is not substring of \"$STRING_A\"."
		return 0
	else
		echo "\"$STRING_B\" is substring of \"$STRING_A\"."
		return 1
	fi
}

# 使用通配符
function substr1
{
	if [[ $1 == *$2* ]]
	then
		echo "\"$2\" is substring of \"$1\"."
		return 0
	else
		echo "\"$2\" is not substring of \"$1\"."
		return 1
	fi
}

if test $# == 0;then
	substr "ThisIsAString" "SUBString"
	substr "ThisIsAString" "String"
elif test $# == 2;then
	echo "substr test:"; substr $1 $2
	echo "substr1 test:"; substr1 $1 $2
else
	echo "Need 2 parameters."
fi
