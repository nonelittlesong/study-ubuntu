# branch

语法：

```sh
# 显示分支
git branch [--color[=<when>] | --no-color] [--show-current]
	[-v [--abbrev=<n> | --no-abbrev]]
	[--column[=<options>] | --no-column] [--sort=<key>]
	[--merged [<commit>]] [--no-merged [<commit>]]
	[--contains [<commit>]] [--no-contains [<commit>]]
	[--points-at <object>] [--format=<format>]
	[(-r | --remotes) | (-a | --all)]
	[--list] [<pattern>…]
git branch [--track[=(direct|inherit)] | --no-track] [-f] <branchname> [<start-point>]
git branch (--set-upstream-to=<upstream> | -u <upstream>) [<branchname>]
git branch --unset-upstream [<branchname>]
git branch (-m | -M) [<oldbranch>] <newbranch>
git branch (-c | -C) [<oldbranch>] <newbranch>
git branch (-d | -D) [-r] <branchname>…
git branch --edit-description [<branchname>]
```

## 选项

- `-a` `--all` — 显示所有分支。
- `-l` `--list` — 根据匹配模式列出分支，例如 `git branch --list "maint-*"` 或 `git branch --list maint-*`（可以省略双引号，使用单引号不会转义）。
- `-v` `--verbose`  — `-vv` 显示 upstream 分支。
## 命令

- `-d` `--delete` 
- `-m` 移动/重命名分支，`-M` 强制模式（-m --force 的缩写）