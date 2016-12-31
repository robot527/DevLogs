#! /bin/bash

# 使用 shell 内置命令 getopts 来处理命令行的位置参数

echo "Parameters for the script $0 are: "$*
echo "Shell Variable OPTIND was initialized to $OPTIND."

while getopts ":a:bc:" opt
do
    case $opt in
        a ) echo "Option a: $OPTARG, next argument idx: $OPTIND";;
        b ) echo "Option b does not need argument, next argument idx: $OPTIND";;
        c ) echo "Option c: $OPTARG, next argument idx: $OPTIND";;
        ? ) echo "Parameter error"
            exit 1;;
    esac
done

#echo $OPTIND
shift $(($OPTIND - 1))

# 通过 shift $(($OPTIND - 1)) 的处理，就除去了 $* 中位置参数的内容
if test $# != 0;then
    echo "The remaining parameters are: "$*
fi
