#! /bin/sh
# 保存执行过的 gdb 命令，以便下一次调试时通过上下键来选择以前的命令

cd ~
touch .gdbhistory
echo "set history file ~/.gdbhistory" > .gdbinit
echo "set history save" >> .gdbinit
