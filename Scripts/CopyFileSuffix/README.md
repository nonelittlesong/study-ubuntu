在某个根目录下，搜索指定后缀的文件进行拷贝。  

# [赋值](https://blog.csdn.net/fyh2003/article/details/7279029)
## 1、 shell变量类型
* 环境变量
* 位置变量
* 预定义的特殊变量
* 用户自定义变量

### \# 环境变量
名称大写。  
部分由系统设定，部分由用户定义。  

### \# 位置变量
命令行参数位置决定的变量。  
*$0 - 命令名称
*$n - 第n个参数

### \# 预定义的特殊变量
| 变量名 | 描述 |
| --- | --- |
| $# | 位置参数个数 |
| $* | 位置参数组成的字符串 |
| $! | 上一个后台命令对应的进程号 |
| $? | 上一个命令的退出状态 |
| $$ | 当前的进程号 PID |

### \# 用户自定义变量
大小写敏感。  
字母或下划线开头，后接字母、数字、下划线。  

## 2、 创建变量
### \# [declare & typeset](http://c.biancheng.net/view/2709.html)
declare 和 typeset（弃用） 都是 Shell 内建命令，他们的用法相同，都用来设置变量的属性。  

语法： `declare [+/-] [aAfFgilprtux] [变量名=变量值]`  

| 选项 | 含义 |
| --- | --- |
| -f \[name] | 列出之前由用户在脚本中定义的函数名称和函数体。 |
| -F \[name] | 仅列出自定义函数名称。 |
| -g name | 在 Shell 函数内部创建全局变量。 |
| -p \[name] | 显示指定变量的属性和值。 |
| -a name | 声明变量为普通数组。 |
| -A name | 声明变量为关联数组（支持索引下标为字符串）。 |
| -i name | 将变量定义为整数型。 |
| -r name\[=value] | 将变量定义为只读（不可修改和删除），等价于 readonly name。 |
| -x name\[=value] | 将变量设置为环境变量，等价于 export name[=value]。 |

### \# 直接赋值
`name=value` 等于号前后不能有空格。  


## 3、 删除变量
`unset name` - unset 不能删除只读变量。  

# 函数

# 判断文件或文件夹状态
* [shell 判断文件或文件夹是否存在](https://blog.csdn.net/benben0729/article/details/80690605)
* 

| shell | 描述 |
| --- | --- |
| -e | 如果 filename存在，则为真 |
| -d | 如果 filename为目录，则为真 |
| -f | 如果 filename为常规文件，则为真 |
| -s | 如果 filename非空，则为真 |
| -L | 如果 filename为符号链接，则为真 |
| -r | 如果 filename可读，则为真 |
| -w | 如果 filename可写，则为真 |
| -x | 如果 filename可执行，则为真 |
| filename1 -nt filename2 | 如果 filename1比 filename2新，则为真 |
| filename1 -ot filename2 | 如果 filename1比 filename2旧，则为真 |


# [提取文件名和目录名](https://blog.csdn.net/sinat_28442665/article/details/84796054)

