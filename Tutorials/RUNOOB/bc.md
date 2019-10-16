```
bc [选项] [参数]
```
选项：  
- `-i` - 强制进入交互式模式  
- `-l` - 定义使用的标准数学库  
- `-w` - 对 POSIX bc 的扩展给出警告信息  
- `-q` - 不打印正常的 GNU bc 环境信息  

参数：  
- 文件 - 指定包含计算任务的文件  

## 通过管道
```sh
$ echo "15+5" | bc
20
```

## 设定小数位
```sh
$ echo 'scale=2; (2.777 - 1.4744)/1' | bc
1.30
```

## 设定进制
```sh
$ echo "ibase=2;111" | bc
7
```
```sh
#!/bin/bash

abc=192 
echo "obase=2;$abc" | bc

abc=11000000 
echo "obase=10;ibase=2;$abc" | bc
```

## 指数
```sh
$ echo "10^10" | bc 
10000000000
$ echo "sqrt(100)" | bc
10
```
