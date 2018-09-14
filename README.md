# study-ubuntu
Notes of ubuntu.
## wiki
* [ssh](https://github.com/nonelittlesong/study-ubuntu/wiki/SSH)
* [git]()
* [pip]()
* [labelimg]()
* [ip设置]()
* [安装oh-my-zsh](https://github.com/nonelittlesong/study-ubuntu/wiki/install-oh-my-zsh)
* [Shell](https://github.com/nonelittlesong/study-ubuntu/wiki/Shell)
* [CentOS User and Group](https://github.com/nonelittlesong/study-ubuntu/wiki/CentOS-User-and-Group)


## Shortcuts
* `ctrl+shift+t`:在原窗口打开终端
* `将窗体托向屏幕两侧实现分屏`

## Commands
**ls与find**
find得到完整路径名  

**进程**  
```
# 查看进程
$ ps -ef|grep mysqld
# 杀死进程
$ kill -9 进程号
```

**zip**  
```
$ zip -r target.zip files
```
**rename file**  
```
$ rm fromfilename tofilename
```
**卸载cmake**  
```
$ sudo apt-get remove cmake
```
>The following packages were automatically installed and are no longer required:  
&nbsp;&nbsp;cmake-data libjsoncpp1  
>Use 'sudo apt autoremove' to remove them.  

**查找文件**  
filename可以是文件名的一部分  
```
$ locate filename
```

## Troubleshooting
**1、 版本更新后输入法出现问题**  
>（1） 打开设置  
>（2） 点击Manager Installed Languages  
>（3） Keyboard input method system:里面有Ibus,XIM(fcitx).none 三种输入架构，如果使用智能拼音就选Ibus，搜狗输入法的话就选XIM。  
>（4） 回到设置input source，选择中文输入法  
>（5） 重启电脑  

**2、 无法链接proxy**  
>(1) 打开preferences  
>(2) General  
>(3) Network Proxy  
>(4) check up proxy  
