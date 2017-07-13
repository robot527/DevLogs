# Linux 命令学习记录

0x01 **man** 命令是 Linux 下的帮助指令，通过 man 指令可以查看 Linux 中的指令帮助、配置文件帮助和编程帮助等信息。例如 `$ man which` 和 `$ man ifconfig`

0x02 **alias** 命令用来设置指令的别名。使用该命令可以将一些较长的命令进行简化。使用 alias 时，用户必须使用单引号''将原来的命令引起来，防止特殊字符导致错误。为了使命令长期有效，在 ubuntu 系统上可将命令写进对应用户目录下的 *.bashrc* 文件里。
例如：
```
    alias l='ls -Alh'  
    # -Alht 表示列出除了 “.” 及 “..”以外的任何项目，输出信息用单列格式输出，以易读的格式输出文件大小，并按修改时间排序。
    alias lt='ls -Alht'  
    alias ppcgcc='/home/crosscompiler/ppc/usr/bin/ppc_8xx-gcc'
```

0x03 **which** 命令用于查找并显示给定命令的绝对路径，环境变量 PATH 中保存了查找命令时需要遍历的目录。which 指令会在环境变量$PATH 设置的目录里查找符合条件的文件。也就是说，使用 which 命令，就可以看到某个系统命令是否存在，以及执行的到底是哪一个位置的命令。例如：`$ which vim`

0x04 查看指定环境变量的命令，例如查看 PATH 和 HOME 的命令：`$ echo $PATH`， `$ echo $HOME` 。

0x05 **more** 命令是一个细读文本文件的过滤器，它以全屏幕或者指定行数的方式按页显示文本文件的内容。more 常用的快捷键有 H （获得帮助信息），Enter （向下滚动一行），空格（向下滚动一屏），B （显示上一屏内容），Q （退出命令）。

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
`more -9 linux.md` 表示每一屏显示 9 行文件内容。

0x06 查找应用程序所占的进程 ID：`ps aux | grep 程序名 `  
例如：  
`$ ps aux | grep firefox`  
`$ ps aux | grep python`  
另有：  
`pgrep firefox`

0x07 当编译或者下载一个程序文件后，想运行该程序却发现被系统拒绝执行，  
这时一般都是因为该文件没有可执行权限，那么可以使用命令： `chmod +x filename`  
或者 `chmod 777 filename`;  
如果想取消某文件的执行权限，可使用命令： `chmod -x filename` 。

0x08 查看 linux 系统是 32 位还是 64 位  
用命令 `arch` 或者 `uname -m` ，输出 i686 表示 32 位系统， x86_64 表示 64 位系统。  
用命令 `file /bin/ls` ， 输出中会有 32-bit 或者 64-bit 字样。  
用命令 `getconf LONG_BIT` 输出一目了然。

0x09 **find** 命令 在指定目录下查找文件  
`find . -name '*.c'` 表示列出当前目录下所有以 *.c* 结尾的文件  
`find /home -name '*.py'` 表示列出 */home* 目录下所有以 *.py* 结尾的文件  
`find . -type f -name '*.log'` 表示列出当前目录下所有普通文件中以 *.log* 结尾的文件  
`find . -name '*.py' -mtime -5` 表示列出当前目录下所有以 *.py* 结尾且在 5 天之内修改过的文件  
`find . -type f -name '*.o' -delete` 表示删除当前目录下所有以 *.o* 结尾的文件  
`find . -name "*.c" -exec chmod -x {} \;` 表示修改当前目录下所有以 *.c* 结尾的文件的执行权限  
`find . -name "*.txt" -exec cat {} > all-txt \;` 表示查找当前目录下所有以 *.txt* 结尾的文件并把他们拼接起来写入到 `all-txt` 文件中

0x0a 用 **tar** 命令打包并压缩工程目录下的代码文件  
将 */home/repo* 目录下除版本控制系统目录以外的所有文件打包并以 gzip 压缩为 *targetname.tar.gz* 文件使用命令：  
`tar zcf targetname.tar.gz /home/repo --exclude-vcs`  
将 */home/repo* 目录下除版本控制系统目录和所有以 *.pyc* *.pyo* *.pyd* 结尾的文件  
以外的所有文件打包并以 gzip 压缩为 *targetname.tar.gz* 文件使用命令：  
`tar zcf targetname.tar.gz /home/repo --exclude-vcs --exclude=*.pyc --exclude=*.pyo --exclude=*.pyd`

0x0b 用 **wget** 下载备份整个网站  
下载备份 Linux 命令大全网站，便于离线时查看  
`wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains man.linuxde.net -o man.linuxde.net.log man.linuxde.net `  
>     命令参数解释：
>     --recursive 开启递归下载（默认递归深度是 5）；
>     --no-clobber 不要覆盖已有文件 (以防下载被中断而重新开始)；
>     --page-requisites 下载 HTML 页面所有需要的元素 (图像、声音、引用样式表等等)；
>     --html-extention 下载 html 相关的文件（该选项在新版中被认为是过时的，建议使用 --adjust-extension）；
>     --convert-links 转换文档中的链接地址，从而本地离线可以正常访问；
>     --restrict-file-names=windows 修改文件名以使文件也可以在 windows 下访问 (某些文件名在 Linux 下有效而在 Windows 下无效)；
>     --domains man.linuxde.net 不要下载 man.linuxde.net 以外的链接地址（如果使用 -H 选项，则该选会关闭）；
>     -o man.linuxde.net.log 记录所有消息到文件 man.linuxde.net.log 保存在当前目录下；
参考： [使用 Wget 下载整个网站](http://lanbing510.info/2015/12/11/Wget.html)

0x0c 使用 **awk** 处理文本  
从格式化输出里提取指定的一列，例如从 `git status` 输出里提取文件名：  
`git status -s | awk '{print $2}'`  
可以写个函数  
```
function col {
	awk -v col=$1 '{print $col}'
}
```
加入文件 *~/.bashrc* 中，并执行命令 `source ~/.bashrc` ，则上一条命令可简化为：  
`git status -s | col 2`  
从格式化输出里提取指定的多列，例如：  
`ps aux | awk '{print $1 "\t" $11}'`  
`ps -e | awk '{print $1 "\t" $4}'`  
打印文件中的多列，例如：  
`awk '{for(i=2;i<=7;i++) printf($i"\t"); printf("\n")}' file.txt` 打印第 2 到 7 列  
`awk '{for(i=1;i<=NF;i+=3) printf($i"\t"); printf("\n")}' a.log` 打印 1、4、7.. 列

0x0d 用 **head** 和 **tail** 查看日志文件  
`head file` 显示 file 头 10 行内容  
`head -c 100 file` 显示文件 file 头 100 字节内容  
`head -n 100 file` 显示文件 file 头 100 行内容  
`head -c -1K file` 显示文件 file 除了最后 1K 字节外的所有内容  

`tail file` 显示文件 file 的最后 10 行内容  
`tail -c 10 file` 显示文件 file 的最后 10 个字节内容  
`tail -n +20 file` 显示文件 file 从第 20 行至文件末尾的内容  
`tail -f file` 输出文件 file 最后 10 行并随着文件增长输出最新追加的内容（查看正在更新的日志文件）  

0x0e 用 **file** 查看文件类型和编码  
`file file.c` 显示文件 *file.c* 的类型和易读的编码信息  
`file -i file.c` 显示文件 *file.c* 的类型和详细的编码信息  
`file -z cppcheck-1.74.tar.gz` 尝试查看压缩文件的信息  
`file -L /bin/sh` 直接显示符号链接所指向的文件的类型信息  
`file *` 显示当前目录下所有文件和目录的类型信息  
`file *.c` 显示当前目录下所有以 *.c* 结尾的文件的类型信息  

0x0f 用 **scp** 传输文件  
```
#从远端机器复制文件到本地
scp root@192.168.1.100:/home/username/.bash_history ~/username.bash_history

#上传本地文件到远端机器的指定目录
scp ~/.bashrc root@192.168.1.100:/home/username/
```

0x10 用 **mount** 挂载服务器上的 samba 共享目录  
`mount -t ext4 -o user=name,uid=1000,gid=1000,pass=test //1.1.1.1/code /home/name/code/`
