[`tee`](https://www.runoob.com/linux/linux-comm-tee.html) 指令会从标准输入设备读取数据，将其内容输出到标准输出设备，同时保存成文件。  

语法：  
```
tee [-ai] [文件...]
```

options：  
- `-a` 或 `--append` - 追加。  

## 例子
### 用 tee 重定向
```
# 输出到 stdout, tailFile
echo '用 tee 重定向' | tee -a tailFile
# 输出到 stdout, tailFile, tailFile2
echo '用 tee 重定向' | tee -a tailFile tailFile2
# 输出到 tailFile, tailFile2
echo '用 tee 重定向' | tee -a tailFile >> tailFile2

# 不用管道
$tee file1 > file2 < example.txt
```
