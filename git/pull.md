参考：  
- https://blog.csdn.net/mynameislinduan/article/details/82147965  
- https://blog.csdn.net/wy01272454/article/details/72846365  
- [git pull --rebase | 简书](https://www.jianshu.com/p/dc367c8dca8e)  


## 一、 git pull --rebase
### 1.1 git pull  
```
git pull = git fetch + git merge FETCH_HEAD 

git pull --rebase =  git fetch + git rebase FETCH_HEAD 
```
### 1.2 marge 和 rebase  
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

### 1.3 rebase 好处
merge 操作遇到冲突的时候，当前 merge 不能继续进行下去。手动修改冲突内容后，add 修改，commit 就可以了。  

而 rebase 操作的话，会中断 rebase, 同时会提示去解决冲突。  
解决冲突后，将修改 add 后执行 `git rebase –continue` 继续操作，或者 `git rebase –skip` 忽略冲突。  
