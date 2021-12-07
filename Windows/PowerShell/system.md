
## 1. 环境变量

PowerShell:

```
# 查看所有环境变量
ls env:

# 搜索环境变量
ls env:NODE*

# 查看单个环境变量
$env:NODE_ENV

# 添加/更新环境变量
$env:NODE_ENV=development

# 删除环境变量
del env:NODE_ENV
```

CMD:

```
# 查看所有环境变量     
set

# 查看单个环境变量     
set NODE_ENV

# 添加/更新环境变量     
set NODE_ENV=development

# 删除环境变量         
set NODE_ENV=
```

**以上环境变量的设置和修改只会在当前窗口下有效！**

