#! /bin/bash

arr=()          #创建一个空数组

echo ${#arr[@]} #数组长度

arr=(1 "two" 3) #初始化数组

echo ${arr[@]}  #输出数组所有元素

echo ${!arr[@]} #输出数组所有索引

arr+=('x') #添加一个值

arr[1]=2 #修改一个元素

echo ${arr[@]}
echo ${#arr[@]}

echo ${arr[@]:1:3} #输出从索引 1 开始的 3 个元素

files=($(ls)) #把 ls 输出的文件保存到数组里

#将文件按大小排序保存到数组，并输出第二大和第五大的文件名
files=($(ls -S))
echo ${files[1]}
echo ${files[4]}
