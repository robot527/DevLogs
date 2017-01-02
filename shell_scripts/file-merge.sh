#! /bin/bash

# 将指定目录下所有指定后缀的文本文件内容合并到一个文件
# 目录默认为当前目录，文件名后缀默认为 txt，输出文件默认为 all. 加后缀

while getopts "d:s:o:" opt
do
    case $opt in
        d ) dir=$OPTARG;;
        s ) suffix=$OPTARG;;
        o ) out=$OPTARG;;
        ? ) echo "Invalid option: -$OPTARG"
            exit 1;;
    esac
done

if test -z "$dir" #字符串的长度为零则为真
then
	dir='.'
else
	cd $dir > /dev/null 2>&1
	if test $? != 0;then
		echo "The directory $dir does not exist."
		exit 1
	fi
fi

if test -z "$suffix"
then
	suffix='txt'
fi

target='*.'$suffix

if test -z "$out"
then
	out='all.'$suffix
else
	if [[ $out != *"."* ]];then
		out=$out'.'$suffix
	fi
fi

if test -e $out;then
	echo $out" already exists."
	exit 1
fi

echo -e "dir:$dir \nsuffix:$suffix \noutfile:$out"

#find $dir -name "$target"

#for file in `ls $dir`; do # 不递归子目录
for file in `find $dir -name "$target"`; do
#	echo $file
	cat $file >> $out
done
