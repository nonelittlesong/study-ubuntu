# Push 和 Pull 和 fetch

<details>
  <summary>References</summary>
  
  - https://blog.csdn.net/mynameislinduan/article/details/82147965  
  - https://blog.csdn.net/wy01272454/article/details/72846365  
  - [git pull --rebase | 简书](https://www.jianshu.com/p/dc367c8dca8e)
  
</details>

<details>
  <summary>Table of Contents</summary>
  
  - [--rebase](#一git-pull---rebase)
  - [--all](#二Push-Pull-所有分支)

</details>

## 一、pull

- [pull 和 fetch 的区别](https://blog.csdn.net/hudashi/article/details/7664457)

### 1.1 git pull --rebase

#### 1.1.1 git pull  

```
git pull = git fetch + git merge FETCH_HEAD 

git pull --rebase =  git fetch + git rebase FETCH_HEAD 
```

#### 1.1.2 marge 和 rebase  

现在我们有这样的两个分支,test和master，提交如下：  
```
       D---E test
      /
 A---B---C---F--- master
```
在master执行git merge test,然后会得到如下结果：  
```
       D--------E
      /          \
 A---B---C---F----G---   test, master
```
在master执行git rebase test，然后得到如下结果：  
```
A---B---D---E---C‘---F‘---   test, master
```
merge操作会生成一个新的节点，之前的提交分开显示。  
而rebase操作不会生成新的节点，是将两个分支融合成一个线性的提交。  

#### 1.1.3 rebase 好处

merge 操作遇到冲突的时候，当前 merge 不能继续进行下去。手动修改冲突内容后，add 修改，commit 就可以了。  

而 rebase 操作的话，会中断 rebase, 同时会提示去解决冲突。  
解决冲突后，将修改 add 后执行 `git rebase –continue` 继续操作，或者 `git rebase –skip` 忽略冲突。  

### 1.2 Push Pull 所有分支

<details>
  <summary>References</summary>
  
  - [Set up git to pull and push all branches | stackoverflow ](https://stackoverflow.com/questions/1914579/set-up-git-to-pull-and-push-all-branches)
  - [Push local Git repo to new remote including all branches and tags | stackoverflow](https://stackoverflow.com/questions/6865302/push-local-git-repo-to-new-remote-including-all-branches-and-tags)

</details>

```
# 推送所有分支
>$ git push REMOTE '*:*'
>$ git push REMOTE --all
>$ git push --all origin

# 拉取所有分支
>$ git fetch --all
>$ git pull --all
```

## 二、Push

**SYNOPSIS**

```
git push [--all | --mirror | --tags] [--follow-tags] [--atomic] [-n | --dry-run] [--receive-pack=<git-receive-pack>]
            [--repo=<repository>] [-f | --force] [--prune] [-v | --verbose]
            [-u | --set-upstream]
            [--[no-]signed|--sign=(true|false|if-asked)]
            [--force-with-lease[=<refname>[:<expect>]]]
            [--no-verify] [<repository> [<refspec>...]]
```

**选项**

- [refspec](https://git-scm.com/book/en/v2/Git-Internals-The-Refspec)
- `--prune` — 删除本地没有对应物的远程分支。例如，  
  `git push --prune remote refs/heads/*:refs/tmp/*`，如果 `refs/heads/foo` 不存在，则会删除远程 `refs/tmp/foo`。

### 2.1 [--force](https://blog.csdn.net/WPwalter/article/details/80371264)

`--force` 经常用于推送 `rebase` 后的提交。  

**git push --force 的安全问题**：当我们向远端推送本地分支的提交时，如果其他人在相同的分支推送了新的提交，`--force` 会删除他们的提交！  

`git push --force-with-lease` 在有其他人新的提交时，会拒绝推送，让操作安全一些。  

## 三、Fetch

fetch 常和 merge 一起用，git fetch + git merge == git pull。  

fetch 下来用 `git diff <reponame>/<branchname>` 查看所处分支与 `<reponame>/<branchname>` 的区别

## 3.1 FETCH_HEAD 概念

查看 FETCH_HEAD 内容：  
```
$ cat .git/FETCH_HEAD 
7c8ca4436afba53f99d3ed37132cec99b0927fda                branch 'master' of https://github.com/nonelittlesong/my-via
761e44832c39dfcf95526a9aa398c2fdf37bcdfa        not-for-merge   branch 'dependabot/npm_and_yarn/electron-7.2.4' of https://github.com/nonelittlesong/my-via
2ae2363c1e3e03cba9af8b8fc4feccbedd119186        not-for-merge   branch 'develop' of https://github.com/nonelittlesong/my-via
```
第一列，commit id；  
第二列，是否是当前 FETCH_HEAD 将要合并的；  
第三列，分支的远程 git库路径

## 3.2 用法

- **git fetch**  
  指令作用：  
  1. 创建并更新**本地远程分支**。即创建并更新 origin/xxx 分支，拉取代码到 origin/xxx 分支上；  
  2. 在 FETCH_HEAD 中设定「当前分支 - origin/当前分支」对应，如直接到时候 git merge 就可以将 origin/abc 合并到 abc 分支上。  

- **git fetch \<reponame>**  
  指定要 fetch 的 remote  

- **git fetch \<reopname> \<branchname>**  
  附加效果：用来测试远程主机的远程分支 `branchname` 是否存在, 如果存在, 返回 0, 如果不存在, 返回128, 抛出一个异常.  

- **git fetch origin branch1:branch2**  
  首先执行上面的 fetch 操作，  
  使用远程 branch1 分支在本地创建 branch2(但不会切换到该分支)，  
  如果本地不存在 branch2 分支, 则会自动创建一个新的 branch2 分支，  
  如果本地存在 branch2 分支, 并且是 `fast forward`，则自动合并两个分支，否则, 会阻止以上操作。  
  
- **git fetch origin :branch2**  
  等价于：git fetch origin master:branch2  
  
