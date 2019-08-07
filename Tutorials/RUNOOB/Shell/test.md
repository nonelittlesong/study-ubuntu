`test` 和 `[]` 等价。  

用法：  
* `test expression` - 当 test 判断 expression 成立时，退出状态为0, 否则为非0值。
* `[ expression ]` - `[]` 和 `expression` 之间必须有空格。

例子1：  
```sh
#!/bin/bash

read age

if test $age -le 2; then
    echo "婴儿"
elif test $age -ge 3 && test $age -le 8; then
    echo "幼儿"
elif [ $age -ge 9 ] && [ $age -le 17 ]; then
    echo "少年"
elif [ $age -ge 18 ] && [ $age -le 25 ]; then
    echo "成年"
elif test $age -ge 26 && test $age -le 40; then
    echo "青年"
elif test $age -ge 41 && [ $age -le 60 ]; then
    echo "中年"
else
    echo "老年"
fi
```

# 文件检测
文件类型判断：  

| 选 项 |	作 用 |
| --- | --- |
| -d filename | 判断文件是否存在，并且是否为目录文件。 |
| -f filename | 判断文件是否存在，井且是否为普通文件。 |
| -s filename | 判断文件是否存在，并且是否为非空。 |
| -e filename | 判断文件是否存在。 |
| -b filename | 判断文件是否存在，并且是否为块设备文件。 |
| -c filename | 判断文件是否存在，并且是否为字符设备文件。 |
| -L filename | 判断文件是否存在，并且是否为符号链接文件。 |
| -p filename | 判断文件是否存在，并且是否为管道文件。 |
| -S filename | 判断该文件是否存在，并且是否为套接字文件。 |

文件权限判断：  

| 选 项 | 作 用 |
| --- | --- |
| -r filename | 判断文件是否存在，并且是否拥有读权限。 |
| -w filename | 判断文件是否存在，并且是否拥有写权限。 |
| -x filename | 判断文件是否存在，并且是否拥有执行权限。 |
| -u filename | 判断文件是否存在，并且是否拥有 SUID 权限。 |
| -g filename | 判断文件是否存在，并且是否拥有 SGID 权限。 |
| -k filename | 判断该文件是否存在，并且是否拥有 SBIT 权限。 |

文件比较：  

| 选 项 | 作 用 |
| --- | --- |
| filename1 -nt filename2 | 判断 filename1 的修改时间是否比 filename2 的新。 |
| filename1 -ot filename2 | 判断 filename1 的修改时间是否比 filename2 的旧。 |
| filename1 -ef filename2 | 判断 filename1 是否和 filename2 的 inode 号一致，可以理解为两个文件是否为同一个文件。这个判断用于判断硬链接是很好的方法 |

例子2：  
```sh
#!/bin/bash

read filename
read url

if test -w $filename && test -n $url
then
    echo $url > $filename
    echo "写入成功"
else
    echo "写入失败"
fi
```

# 数值比较

| 选项 | 作用 |
| --- | --- |
| num1 -eq num2 | 判断 num1 是否和 num2 相等。 |
| num1 -ne num2 | 判断 num1 是否和 num2 不相等。 |
| num1 -gt num2 | 判断 num1 是否大于 num2 。 |
| num1 -lt num2 | 判断 num1 是否小于 num2。 |
| num1 -ge num2 | 判断 num1 是否大于等于 num2。 |
| num1 -le num2 | 判断 num1 是否小于等于 num2。 |

>**注：** test 只能用来比较整数，小数相关的比较还得依赖 bc 命令。  


# 字符串判断

| 选 项 | 作 用 |
| --- | --- |
| -z str | 判断字符串 str 是否为空。 |
| -n str | 判断宇符串 str 是否为非空。 |
| str1 = str2 | |
| str1 == str2 | =和==是等价的，都用来判断 str1 是否和 str2 相等。 |
| str1 != str2 | 判断 str1 是否和 str2 不相等。 |
| str1 \> str2 | 判断 str1 是否大于 str2。\>是>的转义字符，这样写是为了防止>被误认为成重定向运算符。 |
| str1 \< str2 | 判断 str1 是否小于 str2。同样，\<也是转义字符。 |

>**注：** ==、>、< 在大部分编程语言中都用来比较数字，而在 Shell 中，它们只能用来比较字符串，不能比较数字。  
>其次，不管是比较数字还是字符串，Shell 都不支持 >= 和 <= 运算符。  

字符串比较例子：  
```sh
#!/bin/bash

read str1
read str2

#检测字符串是否为空
if [ -z "$str1" ] || [ -z "$str2" ]  # 引号防止变量为空导致错误
then
    echo "字符串不能为空"
    exit 0
fi

#比较字符串
if [ $str1 = $str2 ]
then
    echo "两个字符串相等"
else
    echo "两个字符串不相等"
fi
```


# 逻辑运算

| 选 项 | 作 用 |
| --- | --- |
| expression1 -a expression2 | 逻辑与，表达式 expression1 和 expression2 都成立，最终的结果才是成立的。 |
| expression1 -o expression2 | 逻辑或，表达式 expression1 和 expression2 有一个成立，最终的结果就成立。 |
| !expression | 逻辑非，对 expression 进行取反。 |


# 引号
`test` 和 `[]` 都是命令，一个命令本质上对应一个程序或者一个函数。即使是一个程序，它也有入口函数，例如C语言程序的入口函数是 main()，运行C语言程序就从 main() 函数开始，所以也可以将一个程序等效为一个函数，这样我们就不用再区分函数和程序了，直接将一个命令和一个函数对应起来即可。  

有了以上认知，就很容易看透命令的本质了：使用一个命令其实就是调用一个函数，命令后面附带的选项和参数最终都会作为实参传递给函数。  

假设 test 命令对应的函数是 func()，使用 `test -z $str1` 命令时，会先将变量 $str1 替换成字符串：  

* 如果 $str1 是一个正常的字符串，比如 abc123，那么替换后的效果就是test -z abc123，调用 func() 函数的形式就是 `func("-z abc123")` 。test 命令后面附带的所有选项和参数会被看成一个整体，并作为实参传递进函数。  
* 如果 $str1 是一个空字符串，那么替换后的效果就是test -z ，调用 func() 函数的形式就是 `func("-z ")` ，这就比较奇怪了，因为-z选项没有和参数成对出现，func() 在分析时就会出错。  


如果我们给 $str1 变量加上双引号，当 $str1 是空字符串时， `test -z "$str1"` 就会被替换为 `test -z ""` ，调用 func() 函数的形式就是 `func("-z \"\"")` ，很显然，-z选项后面跟的是一个空字符串（\"表示转义字符），这样 func() 在分析时就不会出错了。  

所以，当你在 test 命令中使用变量时，我强烈建议将变量用双引号""包围起来，这样能避免变量为空值时导致的很多奇葩问题。  


# (())
对于整形数字的比较，建议使用 `(())`， `(())` 持各种运算符，写法也符合数学规则。  
