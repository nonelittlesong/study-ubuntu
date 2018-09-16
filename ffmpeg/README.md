# Ubuntu 18.04 源码安装 ffmpeg4.0-支持 ffplay
参考：
* https://blog.csdn.net/chuanglan/article/details/80534196  

## 1. 安装yasm
```
$ sudo apt install yasm
```

## 2. 安装SDL2
```
$ sudo apt install libsdl1.2-dev --fixmissing
```
地址： http://www.libsdl.org/download-2.0.php  
解压并安装  
```
$ tar -xvf SDL2-2.0.8.tar.gz 
$ ./configure 
$ make && make install
```

## 3. 安装ffmpeg
地址：https://www.ffmpeg.org/download.html  
解压并安装  
```
$ tar -xvf ffmpeg.4.0.tar.bz2
$ ./configure 
$ make && make install
```
