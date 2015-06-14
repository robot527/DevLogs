#git的学习记录

##git简介
Git -- The stupid content tracker, 傻瓜内容跟踪器。Linus Torvalds 是这样给我们介绍 Git 的。  
Git是一款免费、开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。

##常用的git命令的解释
使用命令 __git --help__ 可以查到，  
最常用的 git 命令有：  
    add          添加文件内容至索引  
    bisect       通过二分查找定位引入 bug 的变更  
    branch       列出、创建或删除分支  
    checkout     检出一个分支或路径到工作区  
    clone        克隆一个版本库到一个新目录  
    commit       记录变更到版本库，也就是 提交  
    diff         显示提交之间、提交和工作区之间等的差异  
    fetch        从另外一个版本库下载对象和引用  
    grep         输出和模式匹配的行  
    init         创建一个空的 Git 版本库或重新初始化一个已存在的版本库  
    log          显示提交日志  
    merge        合并两个或更多开发历史  
    mv           移动或重命名一个文件、目录或符号链接  
    pull         获取并整合另外的版本库或一个本地分支  
    push         更新远程引用和相关的对象  
    rebase       本地提交转移至更新后的上游分支中  
    reset        重置当前 HEAD 到指定状态  
    rm           从工作区和索引中删除文件  
    show         显示各种类型的对象  
    status       显示工作区状态  
    tag          创建、列出、删除或校验一个 GPG 签名的 tag 对象  
使用命令 __git help 命令__ 可以查看给定的子命令帮助或指南。

##实例一：从零开始
0x01 创建一个文件夹用作项目存放文件夹，并进入新建文件夹  
	$  __mkdir git/DevLogs__  
	$  __cd git/DevLogs__

0x02 创建一个空的 Git 版本库或重新初始化一个已存在的版本库  
	/git/DevLogs$ __git init__

0x03 配置用户信息  
使用全局配置：  
	$ __git config --global user.name "robot527"__ 双引号中填写自己的git用户名  
	$ __git config --global user.email  "robot527@example.com"__ 双引号中填写自己的邮箱  
如果之前配置过，可以跳过这一步。  
如果要针对本项目配置用户信息，可使用局部配置。  
	$ __git config  user.name "robot528"__  
	$ __git config  user.email "robot528@example.com"__ 

0x04 新建一个 .gitignore 或者 README.md 文件，用自己惯用的文本编辑器编写即可

0x05 初始提交
添加所有尚未跟踪的文件内容至索引  
	/git/DevLogs$ __git add .__

提交（记录变更到版本库）  
	/git/DevLogs$ __git commit -m"first commit"__



