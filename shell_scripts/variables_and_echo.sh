#! /bin/bash

my_name="robot527"
echo "Author is $my_name."
echo "I'm ${my_name}!"

# 用花括号包围变量是为了帮助解释器识别变量的边界，推荐给所有变量加上花括号。
echo -e "I'm good at \c" # -e 开启转义, \c 不换行
for method in Heap Insertion Merge Quick; do
	echo -e "${method}Sort, \c"
done
echo -e "and I like Shell !\n"

test='This is a test.'
echo '$test' #单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的。
echo ${test}

unset test
echo ${test}
