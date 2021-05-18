编辑 `/etc/sudoers` 文件。  
命令需在 root 终端执行。  

- [Linux用户配置sudo权限(visudo)](https://blog.csdn.net/a19881029/article/details/18730671)
- [sudo免密和远程执行shell脚本](https://blog.csdn.net/qq_19557947/article/details/70210918)

## 例子
```
ubuntu ALL=(ALL) NOPASSWD: /home/ubuntu/jenkins/train.sh
ubuntu ALL=(ALL:ALL) NOPASSWD: /home/ubuntu/jenkins/train.sh
```

>**注意：**  后面的指令会覆盖前面的指令！！  

## [expect](https://core.tcl-lang.org/expect/index)

参考：

- [Linux Expect 简介和使用实例](https://www.jianshu.com/p/70556b1ce932)
- [通过 shell 调用 expect 执行多条命令](https://www.cnblogs.com/shoufeng/p/11388060.html)
