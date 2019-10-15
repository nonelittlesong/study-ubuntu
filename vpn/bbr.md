## centos

```sh
yum update
cat /etc/redhat-release
```

安装 elrepo 并升级内核：  
```sh
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y
```

更新 grup 文件并重启：  
```sh
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
grub2-set-default 0
reboot
```

查看内核：  
```sh
uname -r
```

开启 bbr：  
```sh
vi /etc/sysctl.conf
```
添加：  
```
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
```

加载系统参数：  
```sh
sysctl -p
```

确认：  
```sh
sysctl net.ipv4.tcp_available_congestion_control   # 返回 net.ipv4.tcp_available_congestion_control = bbr cubic reno

lsmod | grep bbr                                   # 返回 形如 tcp_bbr                16384  1
```
