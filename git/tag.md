>会同时 push 未 push 的代码。  


## 查看标签
```
git tag
git tag -l 'v1.4.2.*'
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
git push origin master :refs/tags/v0.0.0
```
