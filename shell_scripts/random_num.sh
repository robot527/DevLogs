#! /bin/bash

#1.使用系统的 $RANDOM 变量, 范围[0, 32767]
echo "system var RANDOM is" $RANDOM

#生成指定区间的随机整数
function rand_integer(){  
    min=$1  
    max=$(($2-$min+1))  
    num=$(($RANDOM+1000000000)) #增加一个10位的数再求余  
    echo $(($num%$max+$min))  
}

if [ $# == 2 ];then
	randi=$(rand_integer $1 $2)
else
	randi=$(rand_integer 0 100)
fi
echo $randi
echo

#2.使用 date(system date and time)
echo "use date:"
date +%s
#获得时间戳，当前时间到：1970-01-01 00:00:00 相隔的秒数。
#如果用它做随机数，相同一秒的数据是一样的。在做循环处理，多线程里面就不能满足要求了。

date +%N	#获得当前时间的纳秒数据，nanoseconds (000000000..999999999)。
			#同一秒里面，大量循环也很难出现相同结果，不过不同时间里面还会有大量重复碰撞。

date +%s%N	#这个可以说比较完美了，时间戳上加了纳秒。
echo

#3.使用/dev/random 和 /dev/urandom
# /dev/random 存储着系统当前运行环境的实时数据，是阻塞的随机数发生器，读取有时需要等待。
# /dev/urandom 非阻塞随机数发生器，读取操作不会产生阻塞。
echo "use /dev/urandom:"
head -20 /dev/urandom | cksum | cut -f 1 -d " "
echo

#4.读取 linux 的 uuid 码
#UUID码全称是通用唯一识别码 (Universally Unique Identifier)，这是一个软件建构的标准，也是被开源软件基金会 (Open Software Foundation, OSF) 的组织应用在分布式计算环境 (Distributed Computing Environment, DCE) 领域的一部分。
#它的格式包含32个16进制数字，以'-'连接号分为5段。形式为8-4-4-4-12 的32个字符。
echo "use UUID:"
cat /proc/sys/kernel/random/uuid | cksum | cut -f 1 -d " "
echo

#5. 使用 openssl rand
echo "use openssl rand:"
openssl rand 32 -base64 | cksum | cut -f 1 -d " "

