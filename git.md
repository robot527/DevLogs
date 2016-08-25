#git 的学习记录

##git 简介
Git -- The stupid content tracker, 傻瓜内容跟踪器。Linus Torvalds 是这样给我们介绍 Git 的。  
Git 是一款免费、开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。

##常用的 git 命令的解释
使用命令 `git --help` 可以查到，  
最常用的 git 命令有：  
>     add          添加文件内容至索引
>     bisect       通过二分查找定位引入 bug 的变更
>     branch       列出、创建或删除分支
>     checkout     检出一个分支或路径到工作区
>     clone        克隆一个版本库到一个新目录
>     commit       记录变更到版本库，也就是 提交
>     diff         显示提交之间、提交和工作区之间等的差异
>     fetch        从另外一个版本库下载对象和引用
>     grep         输出和模式匹配的行
>     init         创建一个空的 Git 版本库或重新初始化一个已存在的版本库
>     log          显示提交日志
>     merge        合并两个或更多开发历史
>     mv           移动或重命名一个文件、目录或符号链接
>     pull         获取并整合另外的版本库或一个本地分支
>     push         更新远程引用和相关的对象
>     rebase       本地提交转移至更新后的上游分支中
>     reset        重置当前 HEAD 到指定状态
>     rm           从工作区和索引中删除文件
>     show         显示各种类型的对象
>     status       显示工作区状态
>     tag          创建、列出、删除或校验一个 GPG 签名的 tag 对象

使用命令 `git help 命令 ` 可以查看给定的子命令帮助或指南。

##实例一：从零开始
0x01 创建一个文件夹用作项目存放文件夹，并进入新建文件夹  
```
$ mkdir git/DevLogs
$ cd git/DevLogs
```

0x02 创建一个空的 Git 版本库或重新初始化一个已存在的版本库  
/git/DevLogs$ `git init`

0x03 配置用户信息  
使用全局配置：  
```
$ git config --global user.name "robot527" #双引号中填写自己的 git 用户名 
$ git config --global user.email "robot527@example.com" #双引号中填写自己的邮箱
```
如果之前配置过，可以跳过这一步。  
如果要针对本项目配置用户信息，可使用局部配置命令：  
```
$ git config  user.name "robot528"
$ git config  user.email "robot528@example.com" 
```

0x04 新建一个 *.gitignore* 或者 *README.md* 文件，用自己惯用的文本编辑器编写即可

0x05 初始提交  
添加所有尚未跟踪的文件内容至索引：  
/git/DevLogs$ `git add .`  
提交（记录变更到版本库）：  
/git/DevLogs$ `git commit -m"first commit"`

##提高效率一：配置 git 客户端  
0x01 配置文本编辑器：  
```
$ git config --global core.editor emacs
$ git config --global core.editor vi
$ git config --global core.editor gedit
```

0x02 配置 git 运行诸如 log、diff 等所使用的分页器  
默认用的是 less  
```
$ git config --global core.pager more
```

0x03 git 输出信息的着色  
```
$ git config --global color.ui true  #首选配置
$ git config --global color.ui always  #表明在任何情况下都要着色，即使 git 命令被重定向到文件或管道
$ git config --global color.ui false  #不为输出着色
```
还可以分别为各个子命令的输出着色，它们都能被置为 true、false 或 always：  
```
color.branch
color.diff
color.interactive
color.pager
color.status
```

0x04 配置外部的比较工具  
以 Meld 为例：  
在用户目录下创建一个 git-meld.sh 的脚本，  
`vi ~/git-meld.sh `  
加入以下内容：  
```
#!/bin/sh
meld $2 $5
```
保存后更改文件的权限：  
`chmod  +x ~/git-meld.sh `  
最后配置 diff.external：  
`git config  --global diff.external  ~/git-meld.sh `

##实例二：使用 git 远程仓库  
```
$ mkdir Devlogs && cd Devlogs #创建仓库目录并进入该目录
$ git init #初始化空仓库
$ git remote add -t master -m master test https://github.com/robot527/DevLogs.git #添加一个跟踪仓库 master 分支简称为 test 的远程仓库
$ git remote -v #查看远程仓库详情
$ git pull test #获取远程仓库更新
$ git remote set-url --push test git@github.com:robot527/DevLogs.git #设置 test 远程仓库推送的地址（SSH 方式）
$ git push --set-upstream test master #为推送当前分支并建立与远程上游的跟踪
$ git push test #推送本地更新到 test 远程仓库
```
另，要删除 *test* 远程仓库使用命令：`git remote remove test`

##实例三：更新（同步） GitHub 上 fork 的仓库  
```
#添加一个叫作 "upstream" 的远程仓库
$ git remote add upstream https://github.com/robot527/DevLogs.git

#获取上游远程仓库 "upstream" 的更新
$ git fetch upstream

#切换到本地仓库的 master 分支
$ git checkout master

#重写本地的 master 分支
$ git rebase upstream/master

#最后推送到自己 GitHub 账户的远程仓库
$ git push -f origin master
```
