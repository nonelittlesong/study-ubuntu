# remote

语法：

```sh
# 查看远程服务器的名字的 url
git remote [-v | --verbose]
git remote add [-t <branch>] [-m <master>] [-f] [--[no-]tags] [--mirror=(fetch|push)] <name> <url>
git remote rename <old> <new>
git remote remove <name>
git remote set-head <name> (-a | --auto | -d | --delete | <branch>)
git remote set-branches [--add] <name> <branch>…
git remote get-url [--push] [--all] <name>
git remote set-url [--push] <name> <newurl> [<oldurl>]
git remote set-url --add [--push] <name> <newurl>
git remote set-url --delete [--push] <name> <url>
git remote [-v | --verbose] show [-n] <name>…
git remote prune [-n | --dry-run] <name>…
git remote [-v | --verbose] update [-p | --prune] [(<group> | <remote>)…]
```

## 选项

- `v` `--verbose` — 显示远程仓库的 url，必须位于 remote 和 子命令之间。

## 命令

- `set-head` — 设置或删除默认分支
  - 配合 `-d` 或 `--delete`，删除引用 `refs/remotes/<name>/HEAD`