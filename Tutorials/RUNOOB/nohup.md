不挂断地运行程序。  
终端关闭，后台程序继续运行。  

语法： `nohup Command [ Arg … ] [　& ]`  

- 无论是否将 nohup 命令的输出重定向到终端，输出都将附加到当前目录的 nohup.out 文件中。  
- 如果当前目录的 nohup.out 文件不可写，输出重定向到 $HOME/nohup.out 文件中。  
- 如果没有文件能创建或打开以用于追加，那么 Command 参数指定的命令不可调用。  

退出状态：  

- 126 - 可以查找但不能调用 Command 参数指定的命令。  
- 127 - nohup 命令发生错误或不能查找由 Command 参数指定的命令。  
- 否则，nohup 命令的退出状态是 Command 参数指定命令的退出状态。  

参考：  

- [nohup和&后台运行，进程查看及终止](https://www.cnblogs.com/baby123/p/6477429.html)
- [ssh 连接 linux 服务器中断后，如何让命令继续在服务器运行](https://blog.csdn.net/darren817/article/details/79807871)
