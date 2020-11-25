# Git 标签

>会同时 push 未 push 的代码。  

## 查看标签
```
git tag
git tag -l 'v1.4.2.*'
git tag --list 'v1.4.2.*'
git show v1.4.2.1
```

## 添加标签
```
# annotated 标签
git tag -a v1.4 -m 'my annotated tag v1.4'
# signed 标签
git tag -s v1.5 -m 'my signed tag v1.5'
# 轻量级标签
git tag v1.4-lw

git show v1.4
```

## 验证标签
```
git tag -v v1.5
```

## 补加标签
```
# 查看提交历史
git log --pretty=oneline

# 添加标签时加上校验和的前几个字符
git tag -a v1.2 9fceb02d
```

## 推送标签
```
git push gitlab master v1.5

# 一次性推送所有标签
git push gitlab master --tags
```

## 删除标签
本地：  
```
git tag -d v0.0.0
```
远程：  
```
$ git push origin master :refs/tags/<tagname>
$ git push origin master --delete <tagname>
```

## 检出(checkout)标签
会导致仓库处于「分离头指针」的状态：  
```
$ git checkout 2.0.0
Note: checking out '2.0.0'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch>

HEAD is now at 99ada87... Merge pull request #89 from schacon/appendix-final

$ git checkout 2.0-beta-0.1
Previous HEAD position was 99ada87... Merge pull request #89 from schacon/appendix-final
HEAD is now at df3f601... add atlas.json and cover image
```
如果你需要进行更改，比如你要修复旧版本中的错误，那么通常需要创建一个新分支：  
```
$ git checkout -b version2 v2.0.0
Switched to a new branch 'version2'
```
