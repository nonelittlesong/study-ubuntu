发送信号给指定程序。  

默认信号为 TERM（15），终止程序。  
如果仍不能终止，可用 KILL（9） 强制终止。  

语法：  
```
kill [options] <pid> [...]
```

例子：  
```
kill -9 $(ps -ef | grep hnlinux)
```
