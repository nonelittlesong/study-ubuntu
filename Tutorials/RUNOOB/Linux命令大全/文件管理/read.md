`read` 内部命令被用来从标准输入读取单行数据。  
当使用重定向 `<` 的时候，可以读取文件中的一行数据。  

# 语法
```
read [-ers] [-a aname] [-d delim] [-i text] [-n nchars] [-N nchars] [-p prompt] [-t timeout] [-u fd] [name ...]
```

- `r` >> 屏蔽 `\`，如果没有该选项，则 `\` 作为一个转义字符，有的话 `\` 就是个正常的字符了。

# 例子
读取文件到变量中：  
```
#!/bin/bash

DESCRIPTION_FILE_PATH=$1

if [[ $1 == "" ]]; then
    echo "Missing parameter!"
    exit 1
fi

DESCRIPTION=''

# Load description from file
while read -r line; do
    DESCRIPTION="${DESCRIPTION}${line}%0A"
done < ${DESCRIPTION_FILE_PATH}

echo ${DESCRIPTION}
```
