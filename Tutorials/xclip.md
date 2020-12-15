# xclip

剪切板命令。

参考：

- [使用 xclip 在 Linux 命令行中复制粘贴 | 知乎](https://zhuanlan.zhihu.com/p/73286091)
- [xclip剪切板与终端的通道 | CSDN](https://blog.csdn.net/pfanaya/article/details/7665853)
## 1. 安装

Ubuntu16.04

```
$ sudo apt install xclip
```

## 2. 使用

复制：

```
## 复制终端输出
$ ls -al | xclip -sel c

## 复制文件内容
$ xclip -sel c /etc/apt/sources.list
```

粘贴：

```
## 粘贴到终端
$ xclip -sel c -o

## 粘贴到文件
$ xclip -sel c -o > ~/test.txt
```
