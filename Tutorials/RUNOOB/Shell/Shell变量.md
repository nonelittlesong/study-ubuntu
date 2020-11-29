>注： 变量名和等号之间不能有空格。  

## 一、使用变量名
```sh
your_name="song"
echo $your_name
echo ${your_name}
```
花括号帮助解释器识别变量的边界：  
```sh
for skill in Ada Coffe Action Java; do
    echo "I am good at ${skill}Script"
done
```
**推荐给所有的变量加上花括号，这是一个良好的编程习惯。**  

### 1.1 readonly
```sh
#!/bin/bash
myUrl="http://www.google.com"
readonly myUrl
myUrl="http://www.runoob.com"
```

### 1.2 unset
```
unset variable_name
```
>注： unset不能删除只读变量。  

### 1.3 变量类型
运行shell时，会同时存在三种变量：  
1. **局部变量**  - 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2. **环境变量**  - 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
3. **shell变量** - shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行

[另一种分类](https://github.com/nonelittlesong/study-ubuntu/tree/master/Scripts/CopyFileSuffix)  
* 环境变量
* 位置变量
* 预定义的特殊变量
* 用户自定义变量

#### \# 环境变量
名称大写。  
部分由系统设定，部分由用户定义。  

- $PWD - print working direcotry，当前工作目录。

#### \# 位置变量
命令行参数位置决定的变量。  
*$0 - 命令名称
*$n - 第n个参数

#### \# [预定义的特殊变量](https://github.com/nonelittlesong/study-ubuntu/blob/master/Tutorials/RUNOOB/Shell/%E5%8F%82%E6%95%B0.md)
| 变量名 | 描述 |
| --- | --- |
| $# | 位置参数个数 |
| $* | 位置参数组成的字符串 |
| $! | 上一个后台命令对应的进程号 |
| $? | 上一个命令的退出状态 |
| $$ | 当前的进程号 PID |

#### \# 用户自定义变量
大小写敏感。  
字母或下划线开头，后接字母、数字、下划线。  

- `local` — 定义局部变量
  - Shell 脚本中定义的变量是 global，其作用域从定义开始，到 shell 结束或被显式删除为止。
  - Shell 函数中定义的变量默认是 global，其作用域从函数被调用时开始，到 shell 结束或被显式删除为止。
  - Shell 函数中的变量可定义为 local，作用域在函数内，会覆盖同名的 global 变量。
- `export` — 将自定义变量设定为系统环境变量(仅限于当前 TTY)
  - 语法：`export [-fnp] [变量名]=[变量值]`  
    `-f` — 代表「变量名」为函数名  
    `-n` — 删除指定变量。变量实际上并未删除，只是不会输出到后续指令的执行环境中。  
    `-p` — 列出所有 shell 的环境变量。  
- `declare`
  - 语法：`declare [+/-][rxi][变量名称＝设置值] 或 declare -f`  
    `+/-` — 取消/指定 变量的属性。  
    `-f` — 仅显示函数。  
    `r` — 只读。  
    `x` — 设为环境变量。  
    `i` — 「设置值」可以是数值、字符串或运算式。  

## 二、Shell字符串
### 2.1 单引号

* 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
* 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

### 2.2 双引号

* 双引号里可以有变量
* 双引号里可以出现转义字符

```sh
your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1
# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !'
echo $greeting_2  $greeting_3
```
输出结果：  
```
hello, runoob ! hello, runoob !
hello, runoob ! hello, ${your_name} !
```

### 2.3 字符串长度 \#
```sh
string="abcd"
echo ${#string} #输出 4
```
 
### 2.4 提取子串 \:
```
string="runoob is a great site"
echo ${string:1:4} # 输出 unoo
```

### 2.5 查找子串
查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
```sh
string="runoob is a great site"
echo `expr index "$string" io`  # 输出 4
```


## 三、Shell数组
### 3.1 定义数组
```sh
array_name=(value0 value1 value2 value3)
```
或者
```sh
array_name=(
value0
value1
value2
value3
)
```
还可以单独定义数组的各个分量：  
```sh
array_name[0]=value0
array_name[1]=value1
array_name[n]=valuen
```
可以不使用连续的下标，而且下标的范围没有限制。  

### 3.2 读取数组
```sh
valuen=${array_name[n]}
```
使用`@`获取数组中的所有元素：  
```sh
echo ${array_name[@]}
```

`${array_name}` 相当于 `${array_name[0]}`

### 3.3 长度
```sh
# 取得数组元素的个数
length=${#array_name[@]}
# 或者
length=${#array_name[*]}
# 取得数组单个元素的长度
lengthn=${#array_name[n]}
```


## 四、Shell 注释
### 4.1 多行
多行注释还可以使用以下格式：  
```sh
:<<EOF
注释内容...
注释内容...
注释内容...
EOF
```
EOF 也可以使用其他符号:  
```sh
:<<!
注释内容...
注释内容...
注释内容...
!
```

### 4.2 单行
`#`
