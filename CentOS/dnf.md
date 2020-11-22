# Dandified YUM
更强的 YUM。  

## 指令

查找、安装和卸载
```sh
# 已安装包的列表
dnf list installed
# 或者
dnf list available

# 查找软件包
dnf search <package>

# 安装软件包
dnf install <package>

# 重装软件包
dnf reinstall <package>

# 下载软件包
dnf download <package>

# 查看软件包信息
dnf info httpd

# 卸载指定安装包
dnf remove <package>
# 自动删除不需要的依赖包
dnf autoremove
# 清除缓存
dnf clean all
```

更新  
```sh
# 检测系统上所有**系统包**的更新
dnf check-update

# 更新系统中的所有安装包
dnf update

# 更新特定的软件包
dnf update <package>
```

组包  
```sh
# 列出组包
dnf grouplist
# 安装特定的组包
dnf groupinstall 'System Tools'
# 更新特定的组包
dnf groupupdate 'System Tools'
```

库列表  
```sh
# 列出系统库文件
dnf repolist
# 列出所有库文件
dnf repolist all
```
