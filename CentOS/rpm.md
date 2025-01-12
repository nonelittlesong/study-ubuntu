# RPM

```sh
# 安装
rpm - i
# 升级
rpm -U
# 验证
rpm -V
```

## 查询

```sh
# 查询安装的包
rpm -qa | grep xxx

# 查询安装的包的详细信息
rpm -qai | grep xxx
```

## 卸载

```sh
rpm -e
```

## RPM 包默认安装路径

| 安装路径 | 含义 |
| --- | --- |
| /etc/ | 配置文件安装目录 |
| /usr/bin/ | 可执行的命令安装目录 |
| /usr/lib/ | 程序所使用的函数库保存位置 |
| /usr/share/doc/ | 基本的软件使用手册保存位置 |
| /usr/share/man/ | 帮助文件保存位置 |
