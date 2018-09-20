# easy to use ubuntu 16.04
## root
```
$ sudo passwd root
```
## vim
```
$ sudo apt install vim
```
## input method
* System Settings...
* Language Support
* install/remove language
* keyboard input method system: fcitx
* $ sudo apt-get install fcitx-googlepinyin
* reboot

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
[getlantern/download](https://github.com/getlantern/download/wiki)

## Android Studio
* 下载[android-studio](http://www.android-studio.org/)
* `$ tar zxvf xxx.tar.gz`

## OpenCV4Android
* 下载[opencv sdk](https://opencv.org/releases.html)
