#Linux命令学习记录

0x01 **man**命令是Linux下的帮助指令，通过man指令可以查看Linux中的指令帮助、配置文件帮助和编程帮助等信息。例如`$ man which` 和 `$ man ifconfig`

0x02 **alias**命令用来设置指令的别名。使用该命令可以将一些较长的命令进行简化。使用alias时，用户必须使用单引号''将原来的命令引起来，防止特殊字符导致错误。为了使命令长期有效，在ubuntu系统上可将命令写进对应用户目录下的 *.bashrc* 文件里。
例如：
```
    alias l='ls -Alh'  
    # -Alht表示列出除了 “.” 及 “..”以外的任何项目，输出信息用单列格式输出，以易读的格式输出文件大小，并按修改时间排序。
    alias lt='ls -Alht'  
    alias ppcgcc='/home/crosscompiler/ppc/usr/bin/ppc_8xx-gcc'
```

0x03 **which**命令用于查找并显示给定命令的绝对路径，环境变量 PATH 中保存了查找命令时需要遍历的目录。which指令会在环境变量$PATH设置的目录里查找符合条件的文件。也就是说，使用which命令，就可以看到某个系统命令是否存在，以及执行的到底是哪一个位置的命令。例如：`$ which vim`

0x04 查看指定环境变量的命令，例如查看 PATH 和 HOME 的命令：`$ echo $PATH`， `$ echo $HOME` 。

0x05 **more**命令是一个细读文本文件的过滤器，它以全屏幕或者指定行数的方式按页显示文本文件的内容。more常用的快捷键有H（获得帮助信息），Enter（向下滚动一行），空格（向下滚动一屏），B（显示上一屏内容），Q（退出命令）。

>     可选参数：
>     -<数字>：指定每屏显示的行数；
>     -d：显示“[press space to continue,'q' to quit.]”，如果按错键，则会显示 [Press 'h' for instructions.] 而不是响铃； 
>     -c：不进行滚屏操作，先显示内容后再清除屏幕； 
>     -p：不进行滚屏操作，先清除屏幕后再显示内容；
>     -s：将多个空行压缩成一行显示； 
>     -u：禁止下划线； 
>     +<数字>：从指定数字的行开始显示文件内容。
例如：  
`more -s linux.md` 表示逐页显示文件 *linux.md* 的内容，如有连续两行以上空白行则以一行空白行显示。  
`more -9 linux.md` 表示每一屏显示9行文件内容。

0x06 查找应用程序所占的进程ID：`ps aux | grep 程序名`  
例如：  
`$ ps aux | grep firefox`  
`$ ps aux | grep python`  

0x07 当编译或者下载一个程序文件后，想运行该程序却发现被系统拒绝执行，  
这时一般都是因为该文件没有可执行权限，那么可以使用命令： `chmod +x filename`  
或者 `chmod 777 filename`;  
如果想取消某文件的执行权限，可使用命令： `chmod -x filename` 。

0x08 查看 linux 系统是32位还是64位  
用命令 `arch` 或者 `uname -m` ，输出 i686 表示32位系统， x86_64 表示64位系统。  
用命令 `file /bin/ls` ， 输出中会有 32-bit 或者 64-bit 字样。  
用命令 `getconf LONG_BIT` 输出一目了然。

0x09 **find**命令 在指定目录下查找文件  
`find . -name '*.c'` 表示列出当前目录下所有以 *.c* 结尾的文件  
`find /home -name '*.py'` 表示列出 */home* 目录下所有以 *.py* 结尾的文件  
`find . -type f -name '*.log'` 表示列出当前目录下所有普通文件中以 *.log* 结尾的文件  
`find . -name '*.py' -mtime -5` 表示列出当前目录下所有以 *.py* 结尾且在5天之内修改过的文件  
`find . -type f -name '*.o' -delete` 表示删除当前目录下所有以 *.o* 结尾的文件

0x0a 用**tar**命令打包并压缩工程目录下的代码文件  
将 */home/repo* 目录下除版本控制系统目录以外的所有文件打包并以 gzip 压缩为 *targetname.tar.gz* 文件使用命令：  
`tar zcf targetname.tar.gz /home/repo --exclude-vcs`  
将 */home/repo* 目录下除版本控制系统目录和所有以 *.pyc* *.pyo* *.pyd* 结尾的文件  
以外的所有文件打包并以 gzip 压缩为 *targetname.tar.gz* 文件使用命令：  
`tar zcf targetname.tar.gz /home/repo --exclude-vcs --exclude=*.pyc --exclude=*.pyo --exclude=*.pyd`
