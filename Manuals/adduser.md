## `adduser`
默认创建： 用户、和用户同名的组、家目录。  
复制 `/etc/skel` 中的文件到家目录。  
提示设置密码。  

### 选项

- `--system` - 创建系统用户或组。  
- `--group` - 当 `--system` 和 `--group` 一起使用，将创建和用户同名同ID的组。  
- `--no-create-home` - 不创建 home 目录。  
