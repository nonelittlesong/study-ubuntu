# easy to use ubuntu 16.04
## root
```
$ sudo passwd root
```
## git
`sudo apt install git`  

## pip
https://github.com/nonelittlesong/study-ubuntu/wiki/pip  

## vim
* `$ sudo apt install vim`
* [Lightest vimrc, while strong enough. 最轻的vim配置，却足够强！](https://github.com/Bilibili/vim-vide)

## input method
* System Settings...
* Language Support
* install/remove language
* keyboard input method system: fcitx
* $ sudo apt-get install fcitx-googlepinyin
* reboot

## grub
* `sudo vim /boot/grub/grub.cfg`
* 修改`set default`

## java
* download [jdk](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* $ tar zxvf Downloads/XXX.tar.gz
* 配置环境`sudo vim /etc/profile`
  * export JAVA_HOME=/xxx/xxx/xxx
  * export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
  * export PATH=$JAVA_HOME/bin:$PATH
* `source /etc/profile`
* reboot
## Lantern
* [getlantern/download](https://github.com/getlantern/download/wiki)

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
