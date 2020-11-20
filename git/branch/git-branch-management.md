# Git 分支管理策略

<details>
<summary>参考</summary>

- [Git 分支管理策略 | 阮一峰](http://www.ruanyifeng.com/blog/2012/07/git.html)  
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

>**`--no-ff`**  
>默认情况下，Git 执行「快进式合并」(fast-forward merge)，会直接将 Master 分支指向 Develop 分支。  


## 三、临时性分支

- 功能（feature）分支  
- 预发布（release）分支  
- 修补bug（fixbug）分支  

使用完后，应该删除使代码库的常设分支始终只有 Master 和 Develop。  

## 四、功能分支

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

## 五、预发布分支
