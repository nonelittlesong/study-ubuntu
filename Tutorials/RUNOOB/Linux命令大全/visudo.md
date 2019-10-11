编辑 `/etc/sudoers` 文件。  
命令需在 root 终端执行。  

- [Linux用户配置sudo权限(visudo)](https://blog.csdn.net/a19881029/article/details/18730671)
- [sudo免密和远程执行shell脚本](https://blog.csdn.net/qq_19557947/article/details/70210918)

## 例子
```
ubuntu ALL=(ALL) NOPASSWD: /home/ubuntu/jenkins/train.sh
ubuntu ALL=(ALL) NOPASSWD: /home/ubuntu/jenkins/train.sh
```
