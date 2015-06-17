#Linux命令学习记录

 1. **man**命令是Linux下的帮助指令，通过man指令可以查看Linux中的指令帮助、配置文件帮助和编程帮助等信息。例如`$ man which` 和 `$ man ifconfig`

 2. **alias**命令用来设置指令的别名。使用该命令可以将一些较长的命令进行简化。使用alias时，用户必须使用单引号''将原来的命令引起来，防止特殊字符导致错误。为了使命令长期有效，在ubuntu系统上可将命令写进对应用户目录下的 *.bashrc* 文件里。
例如：
```
alias l='ls -Alh'  
# -Alht表示列出除了 “.” 及 “..”以外的任何项目，输出信息用单列格式输出，以易读的格式输出文件大小，并按修改时间排序。  
alias lt='ls -Alht'  
alias ppcgcc='/home/crosscompiler/ppc/usr/bin/ppc_8xx-gcc'
```

 3. **which**命令用于查找并显示给定命令的绝对路径，环境变量 PATH 中保存了查找命令时需要遍历的目录。which指令会在环境变量$PATH设置的目录里查找符合条件的文件。也就是说，使用which命令，就可以看到某个系统命令是否存在，以及执行的到底是哪一个位置的命令。例如：`$ which vim`

 4. 查看环境变量的命令：`$ echo $PATH`

