
## chsh
改变 `login shell`。  

options：  
- `-h, --help` - 查看帮助。
- `-R, --root CHROOT_DIR`
- `-s, --shell SHELL` - 设置新的 `login shell`

`/etc/passwd`:  
```
username:password:UID:GID:comment:home directory: shell
```
- comment - 给用户帐号做的注解。可以是真实姓名、电话号码、住址等。


## chfn
修改用户实际信息。

options：  

- `-f, --full-name` - 用户全名
- `-h, --home-phone` - 家庭电话
- `-o, --other` - 其他信息
- `-r, --room` - 房间号
- `-R, --root` - 修改 `CHROOT_DIR`
- `-w, --work-phone` - 工作电话
