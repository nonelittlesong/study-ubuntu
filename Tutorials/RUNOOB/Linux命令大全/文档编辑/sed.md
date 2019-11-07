### 语法
```sh
sed [OPTION]... {script-only-if-no-other-script} [input-file]...
```
#### OPTIONs：
* -i\[SUFFIX], --in-place\[=SUFFIX]  
  直接在原文件中修改，如果提供SUFFIX，会生成备份。  
  
#### COMMANDs：
* r filename  
  追加从文件中读取的内容。  
  
#### Addresses：
* /regexp/  
  匹配所有满足正则式的行。  
  
  
# 在脚本文件中使用sed
```sh
sed -i '1i {"id": '$id', "switch": '$switch', "result": '$result', "totalOK": '$totalOK', "totalNG": '$totalNG'}' $file
```

```sh
a="one"
b="two"
# 第一种：
eval sed -i 's/$a/$b/' filename
# 第二种（推荐）：
sed -i "s/$a/$b/" filename
# 第三种：
sed -i 's/'$a'/'$b'/' filename 
# 第四种：
sed -i s/$a/$b/ filename
```

# 空文件插入
```sh
if test -s $file; then
    sed -i '1i {"id": '$id', "switch": '$switch', "result": '$result', "totalOK": '$totalOK', "totalNG": '$totalNG'}' $file
else
    echo "{\"id\": $id, \"switch\": $switch, \"result\": $result, \"totalOK\": $totalOK, \"totalNG\": $totalNG}" >> $file
fi
```


# 追加指定文件中的内容
```sh
#!/usr/bin/env sh          
                            
VIA_JS_FILE=via.js         
TEMPLATE_HTML_FILE=index.html
TARGET_HTML_FILE=via.html  
GOOGLE_ANALYTICS_JS_FILE=via_google_analytics.js

TMP_FILE=temp.html         

# source: http://stackoverflow.com/questions/16811173/bash-inserting-one-files-content-into-another-file-after-the-pattern                     
sed -e '/<!--AUTO_INSERT_VIA_JS_HERE-->/r./'$VIA_JS_FILE $TEMPLATE_HTML_FILE > $TMP_FILE 
sed -e '/<!--AUTO_INSERT_GOOGLE_ANALYTICS_JS_HERE-->/r./'$GOOGLE_ANALYTICS_JS_FILE $TMP_FILE > $TARGET_HTML_FILE
rm -f $TMP_FILE            
echo 'Written html file to '$TARGET_HTML_FILE   
```

# 插入和追加
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

# 替换
>**注意：**  
>使用 `：` 解决斜杠 `/` 的问题。  

```sh
# 替换字符
sed 'y/1234567890/ABCDEFGHIJ/' y_file > result_file
sed -i 'y/1234567890/ABCDEFGHIJ/' y_file

# 替换字符串
sed 's/01/Ab/g' s_file > result_file
sed -i 's/01/Ab/g' s_file
