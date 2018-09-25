# study-ubuntu
Notes of ubuntu.
## wiki
* [ssh](https://github.com/nonelittlesong/study-ubuntu/wiki/SSH)
* [git](https://github.com/nonelittlesong/study-ubuntu/wiki/git)
* [pip](https://github.com/nonelittlesong/study-ubuntu/wiki/pip)
* [labelimg](https://github.com/nonelittlesong/study-ubuntu/wiki/LabelImg)
* [ip设置](https://github.com/nonelittlesong/study-ubuntu/wiki/ip%E8%AE%BE%E7%BD%AE)
* [安装oh-my-zsh](https://github.com/nonelittlesong/study-ubuntu/wiki/install-oh-my-zsh)
* [Shell](https://github.com/nonelittlesong/study-ubuntu/wiki/Shell)
* [CentOS User and Group](https://github.com/nonelittlesong/study-ubuntu/wiki/CentOS-User-and-Group)


## Shortcuts
* `ctrl+shift+t`:在原窗口打开终端
* `将窗体托向屏幕两侧实现分屏`
* `Ctrl+Super+D` 最小化所有窗口
* `Super` 显示快捷键

## Commands
**updatedb**  
更新slocate  

**dpkg -l**  
>第一个字符为期望值,它包括:  
>u 状态未知,这意味着软件包未安装,并且用户也未发出安装请求。  
>i 用户请求安装软件包。  
>r 用户请求卸载软件包。  
>p 用户请求清除软件包。  
>h 用户请求保持软件包版本锁定。  
>
>第二个字符是软件包的当前状态,它包括:  
>n 软件包未安装。  
>i 软件包安装并完成配置。  
>c 软件包以前安装过,现在删除了,但是它的配置文件还留在系统中。  
>u 软件包被解包,但还未配置。  
>f 试图配置软件包,但是失败了。  
>h 软件包安装,但是但是没有成功。  
>
>第三个字符是错误状态,有四种状态。第一种状态标识没有问题,为空。其它三种包括:  
>h 软件包被强制保持,因为有其它软件包依赖需求,无法升级。  
>r 软件包被破坏,可能需要重新安装才能正常使用(包括删除)。  
>x 软包件被破坏,并且被强制保持。  

**ls与find**  
ls 路径名+通配符 会显示路径名  
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
$ mv fromfilename tofilename
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

**3、 the channel bionic partner is unknown**  
用`sudo apt install flashplugin-installer`
