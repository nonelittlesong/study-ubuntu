# [set](https://www.runoob.com/linux/linux-comm-set.html)

用于设置 shell。

## 语法

```
set [-abefhkmnptuvxBCHP] [-o option-name] [--] [arg ...]
```

参数说明：

- `-e` — 若指令传回值不等于 0，则立即退出 shell。
- `-x` — 执行指令后，会先显示该指令及所下的参数。
- `+<参数>` — 取消某个 set 曾启动的参数。例如，+x。
