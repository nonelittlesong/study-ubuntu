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

