# adduser
- [useradd vs adduser](https://linuxhandbook.com/useradd-vs-adduser/)

## adduser
默认创建： 用户、和用户同名的组、家目录。  
复制 `/etc/skel` 中的文件到家目录。  
提示设置密码。  

相当于：  
```sh
sudo useradd -d /home/test -m -s/bin/bash \
-c Fullname,Phone,OtherInfo test

passwd test
```

### 语法
```
adduser [options] user group

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
- `--add_extra_groups` - 把新用户添加到额外的组中。  


## `usermod`
更改用户。  

### 语法
`usermod [options] LOGIN`  

- `-a, --append` - 将用户添加到额外的组。只和 `-G` 连用。  
- `-c, --comment COMMENT` - 与 `chfn` 功能相似。  
- `-d, --home HOME_DIR` - 新的家目录（不存在则创建）。原目录的内容会被转移到新目录。  
- `-e, --expiredate EXPIRE_DATE` - 格式 YYYY-MM-DD。用户到期禁用。EXPIRE_DATE 为空会使‘到期时间’无效。  
- `-f, --inactive INACTIVE` - 
- `-g, --gid GROUP` - 


## `gpasswd`
将用户从组删除：  
```sh
gpasswd -d userName groupName
```
