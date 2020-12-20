# Shell 编码规范

- [shell style guide | google](https://google.github.io/styleguide/shellguide.html)

**Table of Contents**

| 章节 | 内容 |
| --- | --- |
| 背景 | 使用哪种 shell - 什么时候用 shell |
| [注释](#2-注释) | [文件开头](#21-文件开头) - [函数注释](#22-函数注释)|

## 1. 背景

### 1.1. 使用哪种 shell

Bash 是唯一被保证能够执行的 shell。强制使用 Bash，确保脚本的一致性。

可执行文件必须以 `#!/bin/bash` 和最少的 flags 开头。  
使用 `set` 设置 shell 选项，避免通过 `bash script_name` 调用你的脚本时中断其功能。

### 1.2. 什么时候用 shell

Shell 只能作为「小工具」或「简单的封装脚本」使用。

## 2. 注释

### 2.1. 文件开头

以简单的内容介绍开头：

```sh
#!/bin/bash
#
# Perform hot backups of Oracle databases
```

### 2.2. 函数注释

- 函数描述
- Globals — 使用和修改的全局变量
- Arguments — 参数
- Outputs — STDOUT 或 STDERR 的输出
- Returns — 返回值，而不是最后一条指令的默认退出状态

```sh
#######################################
# Cleanup files from the backup directory.
# Globals:
#   BACKUP_DIR
#   ORACLE_SID
# Arguments:
#   None
#######################################
function cleanup() {
  …
}

#######################################
# Get configuration directory.
# Globals:
#   SOMEDIR
# Arguments:
#   None
# Outputs:
#   Writes location to stdout
#######################################
function get_dir() {
  echo "${SOMEDIR}"
}

#######################################
# Delete a file in a sophisticated manner.
# Arguments:
#   File to delete, a path.
# Returns:
#   0 if thing was deleted, non-zero on error.
#######################################
function del_thing() {
  rm "$1"
}
```
