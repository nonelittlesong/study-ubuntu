# 装机配置

## 1. 启动盘烧录工具

https://github.com/pbatard/rufus

## 2. 配置软件源

Ubuntu18.04 要在 Applications 中搜索 `Software & Updates`。

## 3. root

```
$ sudo passwd root
```

## 4. git

```
$ sudo apt install git
```

## 5. zsh

https://github.com/robbyrussell/oh-my-zsh  

## 6. vim

* `$ sudo apt install vim`
* [bilibili vim-vide](https://github.com/Bilibili/vim-vide)
* `vim +PlugClean! +PlugUpdate +qa`

## 7. [input method](https://blog.csdn.net/striker_v/article/details/51914637)

* System Settings...
* Language Support
* install/remove language
* keyboard input method system: fcitx
* $ sudo apt-get install fcitx-googlepinyin
* reboot
* 打开终端，输入`fcitx-configtool`。添加输入法，不勾选only Show Current Language,添加Google Pinyin。

Ubuntu18.04：

- [ubuntu18.04安装中文输入法](https://blog.csdn.net/github_39533414/article/details/85211012) — 注意重启电脑。

## 8. java

* download [jdk](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* $ tar zxvf Downloads/XXX.tar.gz
* 配置环境`sudo vim /etc/profile`
  * export JAVA_HOME=/xxx/xxx/xxx
  * export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
  * export PATH=$JAVA_HOME/bin:$PATH
* `source /etc/profile`
* reboot

## grub

* `sudo vim /boot/grub/grub.cfg`
* 修改`set default`

## pip

https://github.com/nonelittlesong/study-ubuntu/wiki/pip

## Android Studio

* 下载[android-studio](http://www.android-studio.org/)
* `$ tar zxvf xxx.tar.gz`

## OpenCV4Android

* 下载[opencv sdk](https://opencv.org/releases.html)

## Wine

[Wine官网](https://www.winehq.org/)  
```
$ wget -nc https://dl.winehq.org/wine-builds/Release.key
$ sudo apt-key add Release.key
$ sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
$ sudo apt-get update
$ sudo apt-get install --install-recommends winehq-stable
```
[ubuntu下Wine使用教程](https://blog.csdn.net/wangchangshuai0010/article/details/12057251)  
安装.msi文件  
```
$ wine msiexec /i install.msi
$ # 或者
$ wine start install.msi
```
[中文乱码](https://www.xuecaijie.com/linux/141.html)  

## KchmViewer

chm文档查看器  
```
$ sudo apt-get install kchmviewer
```
