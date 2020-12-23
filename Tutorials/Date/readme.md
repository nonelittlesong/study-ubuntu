# Linux 日期

## 1. 系统时间 date

设置系统时间：

```
date -s, --set=STRING
```

## 2. 硬件时间 hwclock

设置硬件时间：

```
sudo hwclock --set --date <time>
```

将系统时间写入硬件时间：

```
hwclock --systohc
```

## 3. 网络时间 ntpdate

安装工具：

```
yum -y install ntp ntpdate
```

设置系统时间与网络事件同步：

```
ntpdate cn.pool.ntp.org
# ntpdate ntp1.aliyun.com
```