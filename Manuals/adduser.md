# `adduser`
- [useradd vs adduser](https://linuxhandbook.com/useradd-vs-adduser/)

## `adduser`
默认创建： 用户、和用户同名的组、家目录。  
复制 `/etc/skel` 中的文件到家目录。  
提示设置密码。  

相当于：  
```sh
sudo useradd -d /home/test -m -s/bin/bash \
-c Fullname,Phone,OtherInfo test

passwd test
```

### 选项
```
adduser  [options]  [--home  DIR] [--shell SHELL] [--no-create-home] [--uid ID] [--firstuid ID] [--lastuid ID]
[--ingroup GROUP | --gid ID] [--disabled-password]  [--disabled-login]  [--gecos  GECOS]  [--add_extra_groups]
[--encrypt-home] user
## 创建系统用户
adduser  --system  [options]  [--home  DIR] [--shell SHELL] [--no-create-home] [--uid ID] [--group | --ingroup
GROUP | --gid ID] [--disabled-password] [--disabled-login] [--gecos GECOS] user
```
- `--system` - 创建系统用户，默认放在 `nogroup` 组。通过 `[--ingroup GROUP | --gid ID]` 把用户加入到**已存在**的组中。  
- `--group` - 当 `--system` 和 `--group` 一起使用，将创建和用户同名同ID的组。  
- `--no-create-home` - 不创建 home 目录。  
