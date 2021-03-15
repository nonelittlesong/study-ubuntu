# Git 分支管理策略

<details>
<summary>参考</summary>

- [git flow | github](https://github.com/nvie/gitflow/tree/develop)  
- [A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)  
- [Git 分支管理策略 | 阮一峰](http://www.ruanyifeng.com/blog/2012/07/git.html)  
- [Git 在团队中的最佳实践--如何正确使用 Git Flow](https://www.cnblogs.com/cnblogsfans/p/5075073.html)

</details>

## 一、主分支 Master

主分支只用来发布重大版本。

## 二、开发分支 Develop

这个分支可以用来生成代码的最新隔夜版本(nightly)。如果想正式对外分布，就在 Master 分支上，对 Develop 分支进行合并。  

Git 创建 Develop 分支命令：

```sh
$ git checkout -b develop master
```
将 Develop 分支发布到 Master 分支的命令：  
```sh
# 切换到 Master 分支
git checkout master
# 对 Develop 分支进行合并
git merge --no-ff develop
```

![git-merge.png](https://raw.githubusercontent.com/nonelittlesong/resources/master/images/gitlab/git-merge.png)  

## 三、临时性分支

- 功能（feature）分支  
- 预发布（release）分支  
- 修补bug（fixbug）分支  

使用完后，应该删除使代码库的常设分支始终只有 Master 和 Develop。

### 3.1 功能分支

为了开发某种特定的功能。  

```sh
# 创建一个功能分支
$ git checkout -b feature-x develop
# 将功能分支合并到 develop 分支
$ git checkout develop
$ git merge --no-ff feature-x
# 删除 feature 分支
$ git branch -d feature-x
```

### 3.2 预发布分支
正式版本发布前，需要一个预发布版本进行测试。  
预发布分支是从 Develop 分支上面分出来的。  
命名可采用 `release-x` 或 `release/x` 的形式。  

```sh
# 创建一个预发布分支
$ git checkout -b release-1.2 develop

# 确认没有问题后，合并到 master 分支
$ git checkout master
$ git merge --no-ff release-1.2
# 对合并生成的新节点，做一个标签
$ git tag -a v1.2.0

# 再合并到 develop 分支
$ git checkout develop
$ git merge --no-ff release-1.2

# 最后，删除预发布分支
$ git branch -d release-1.2
```

### 3.3 修补 bug 分支

正式版本发布后，难免出现 bug。需要创建一个分支，进行修复。  
**修补 bug 分支是从 Master 分支上面分出来的。** 修补结束以后，再合并进 Master 和 Develop 分支。  
命名采用 `fixbug-x` 或 `fixbug/x` 的形式。  

![fix-bug-flow](https://raw.githubusercontent.com/nonelittlesong/resources/master/images/gitlab/git-fix-bug.png)  

```sh
# 创建一个修补 bug 的分支
$ git checkout -b fixbug-0.1 master

# 修补结束后，合并到 master 分支
$ git checkout master
$ git merge --no-ff fixbug-0.1
$ git tag -a 0.1.1

# 再合并到 develop 分支
$ git checkout develop
$ git merge --no-ff fixbug-0.1

# 最后，删除 fixbug 分支
$ git branch -d fixbug-0.1
```
