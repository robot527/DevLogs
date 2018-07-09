# sed 文本处理学习笔记


## 替换
```
#替换一次
uname -a | sed 's/x86_64/amd64/'
#替换所有匹配字段
uname -a | sed 's/x86_64/amd64/g'

#当需要从第 N 处匹配开始替换时，可以使用 /Ng
uname -a | sed 's/x86_64/amd64/3g'
uname -a | sed 's/x86_64/amd64/4g'

#以上命令中斜线字符 / 在sed中作为定界符使用，也可以使用其他的定界符：
uname -a | sed 's|x86_64|amd64|g'
uname -a | sed 's@x86_64@amd64@g'

#如果要直接编辑文本文件，使用 -i 选项
sed -i 's|old|NEW|g' /path/to/file

#使用特殊字符 & 代表已匹配的部分
#正则表达式 \w\+ 匹配每一个单词，使用 [&] 替换它， & 对应于之前所匹配到的单词
echo "this is a test line" | sed 's/\w\+/[&]/g'
[this] [is] [a] [test] [line]
```


## 删除
```
#删除空白行
sed '/^$/d' /path/to/file

#删除文件的第 2 行
sed '2d' /path/to/file

#删除文件的第 100 行到末尾所有行
sed '100,$d' /path/to/file

#删除文件最后一行
sed '$d' /path/to/file

#删除文件中所有开头是 test 的行
sed '/^test/'d /path/to/file

#删除文件中匹配 text 的行
sed '/text/'d /path/to/file
```


## 添加
在文件 `.repo/repo/subcmds/forall.py` 中 `setenv('REPO_PROJECT', project.name)` 这一行代码前插入 `      print('\n%s' % project.name)`
```
sed "/setenv('REPO_PROJECT', project.name)/i \      print('\x5cn%s' % project.name)" .repo/repo/subcmds/forall.py

#如果追加到匹配行的后面
sed "/setenv('REPO_PROJECT', project.name)/a \      print('\x5cn%s' % project.name)" .repo/repo/subcmds/forall.py
```

