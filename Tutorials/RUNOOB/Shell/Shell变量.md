>注： 变量名和等号之间不能有空格。  

# 使用变量名
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

## readonly
```sh
#!/bin/bash
myUrl="http://www.google.com"
readonly myUrl
myUrl="http://www.runoob.com"
```

## unset
```
unset variable_name
```
>注： unset不能删除只读变量。  

## 变量类型
运行shell时，会同时存在三种变量：  
1. **局部变量**  - 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
2. **环境变量**  - 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
3. **shell变量** - shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行


# Shell字符串
## 1、 单引号

* 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
* 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

## 2、 双引号

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

## 3、 字符串长度 \#
```sh
string="abcd"
echo ${#string} #输出 4
```
 
## 4、 提取子串 \:
```
string="runoob is a great site"
echo ${string:1:4} # 输出 unoo
```

## 5、 查找子串
查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
```sh
string="runoob is a great site"
echo `expr index "$string" io`  # 输出 4
```

