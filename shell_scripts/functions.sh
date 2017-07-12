#! /bin/bash

# function function_name {
# command...
# }
# or
# 
# function_name () {
# command...
# }
# 
# 
# function_name ()
# {
# command...
# }

# A function may be "compacted" into a single line.
fun () { echo "This is a function."; echo; }


# 输出指定列
function col {
	awk -v col=$1 '{print $col}'
}

# 求两数之和
fsum () {
	echo "$1 + $2" "=" $(($1+$2))
}

# 查看进程的启动时间和运行时间
#function proces_stime{     #error, 函数名与花括号之间要有空格
function process_time {
	pids=$(pgrep -d, $1);
	ps -p $pids -o lstart,etime,cmd;
}



## test
fun
echo "test col :"
ls -l | col 8
echo -e "\ntest fsum :"
fsum -3 9
echo -e "\ntest process_time :"
process_time watchdog

