### 语法
```sh
sed [OPTION]... {script-only-if-no-other-script} [input-file]...
```
#### 参数说明：
* -i\[SUFFIX], --in-place\[=SUFFIX]  
  edit files in place (makes backup if SUFFIX supplied)  


# Examples
## 1、 清除文件所有内容
```sh
sed -i '1,$d' result.txt
```

## 2、 行首插入
```sh
sed -i '1i I am first line' result.txt
```
