# [在 CentOS 系统创建一个 Sudo 用户](https://www.vultr.com/docs/create-a-sudo-user-on-centos)

## 1. 创建账户

```
# adduser example_user
```

设置密码：  
```
# passwd example_user
```

## 2. 用户添加到 Wheel 组

```
# usermod -aG wheel example_user
```

## 3. 编辑 sudoers 文件

查看 wheel 组，如果下面这行注释掉了，则取消注释：  
```sh
## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL
```

## 4. 测试

```
# su - example_user

$ whoami
example_user

$ sudo whoami
[sudo] password for example_user:
root
```
