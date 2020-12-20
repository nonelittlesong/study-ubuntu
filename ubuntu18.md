# Ubuntu 18.04

## Troubleshooting

### 1. system program problem detected

每次开机提示 `system program problem detected`。

解决方案：

这以为着系统「曾经」出现过崩溃，删除错误日志即可：

```sh
$ sudo rm /var/crash/*
```