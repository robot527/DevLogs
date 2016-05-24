#! /bin/bash

# 生成一定长度的斐波纳契数列。

if [ $# != 1 ]; then
	echo "You need to input 1 parameter!"
else
	for i in $(seq 0 $1); do
		if [ $i -le 1 ];then
			fibo[$i]=$i
		else
			let fibo[$i]=fibo[$(($i-1))]+fibo[$(($i-2))]
		fi
		echo -e "${fibo[$i]} \c"
	done
echo
echo ${fibo[@]} #使用@符号可以获取数组中的所有元素
fi
