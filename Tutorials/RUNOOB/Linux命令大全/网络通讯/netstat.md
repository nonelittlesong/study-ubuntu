显示网络信息。  

- [RUNOOB](https://www.runoob.com/linux/linux-comm-netstat.html)

# 一、语法
```
netstat [-acCeFghilMnNoprstuvVwx][-A<网络类型>][--ip]
```

**参数说明:**  

- `-a` 或 `--all` >> 显示所有连线中的 Socket。
- `-A<网络类型>` 或 `--<网络类型>` >> 列出该网络类型连线中的相关地址。
- `-p` 或 `--programs` >> 显示正在使用 Socket 的程序 PID 和程序名称。
- `-x` 或 `--unix` >> 与 `-Aunix` 效果相同。
- `-n` 或 `--numeric` >> 直接使用 IP 地址，而不是域名。
- `-t` 或 `--tcp` >> 显示 TCP。


# 二、例子
## 1、 List your own machine local unix sockets：  
```
netstat -a -p --unix
```
