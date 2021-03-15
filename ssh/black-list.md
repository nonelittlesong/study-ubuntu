# SSH 设置黑名单

- [Linux设置ssh黑/白名单 | CSDN](https://blog.csdn.net/weixin_44316575/article/details/86137956)

## `/etc/ssh/sshd_config`

白名单：

```
# 设置用户
AllowUser USER1 USER2 USER1@HOST
# 设置用户组
AllowGroups GROUP1 GROUP2
```

黑名单：

```
# 设置用户
DenyUser USER1 USER2 USER1@HOST
# 设置用户组
DenyGroups GROUP1 GROUP2
```
