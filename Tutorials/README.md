## 注意字符串
```
a='${xxx} ${yyy}'
sed -i 's/test/'${a}'/' fixcupen.target
```
上述命令会报错。  
原因是 `'s/test/'${a}'/'` 会被理解为**2个**字符串。  

正确写法为：  
```
sed -i "s/test/${a}/" fixcupen.target
```
