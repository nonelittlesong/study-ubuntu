* [官方手册](http://manpages.ubuntu.com/manpages/bionic/man9/adduser.8.html?_ga=2.249074567.107370345.1562717863-810751809.1562717863)

# 描述
默认使用 Debian 策略规划 UID 和 GID，比底层 `useradd`, `groupadd` 和 `usermod`更加友好。  

# 选项
## --system
创建系统用户或组。  

## --group
当 `--system` 和 `--group` 一起使用，将创建和用户同名同ID的组。  

## --no-create-home
不创建 home 目录。  
