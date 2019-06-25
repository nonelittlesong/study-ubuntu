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

## 3、 行末追加
```sh
sed -i '$a I append last line' result.txt
```
在最后一行之前插入：  
```sh
sed -i '$i I insert last line' result.txt
```
在任一行后追加：  
```sh
sed -i '5a I append a line' result.txt
```
在多行后追加：  
```sh
sed -i '8,10a I append some lines' result.txt
```
在多行前插入：  
```sh
sed -i '8,10i I insert some lines' result.txt
```
