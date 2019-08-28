# 一、 config
## 1、 查看信息
```
git config --list
```
## 2、 修改用户和邮箱
```
git config --global user.name "xxx"
git config --global user.email "xxx"
```
**修改指定项目的：**  
```
git config user.name "xxx"
git config user.email "xxx"
```

## 3、 删除
```
git config --global --unset <key>
git config --unset <key>
```

## 4、 编辑配置文件
```
git config --global --edit
git config --edit
```

# 二、 .gitignore
```
#               表示此为注释,将被Git忽略
*.a             表示忽略所有 .a 结尾的文件
!lib.a          表示但lib.a除外
/TODO           表示仅仅忽略项目根目录下的 TODO 文件，不包括 subdir/TODO
build/          表示忽略 build/目录下的所有文件，过滤整个build文件夹；
doc/*.txt       表示会忽略doc/notes.txt但不包括 doc/server/arch.txt
 
bin/:           表示忽略当前路径下的bin文件夹，该文件夹下的所有内容都会被忽略，不忽略 bin 文件
/bin:           表示忽略根目录下的bin文件
/*.c:           表示忽略cat.c，不忽略 build/cat.c
debug/*.obj:    表示忽略debug/io.obj，不忽略 debug/common/io.obj和tools/debug/io.obj
**/foo:         表示忽略/foo,a/foo,a/b/foo等
a/**/b:         表示忽略a/b, a/x/b,a/x/y/b等
!/bin/run.sh    表示不忽略bin目录下的run.sh文件
*.log:          表示忽略所有 .log 文件
config.php:     表示忽略当前路径的 config.php 文件
 
/mtk/           表示过滤整个文件夹
*.zip           表示过滤所有.zip文件
/mtk/do.c       表示过滤某个具体文件
 
被过滤掉的文件就不会出现在git仓库中（gitlab或github）了，当然本地库中还有，只是push的时候不会上传。
 
需要注意的是，gitignore还可以指定要将哪些文件添加到版本管理中，如下：
!*.zip
!/mtk/one.txt
 
唯一的区别就是规则开头多了一个感叹号，Git会将满足这类规则的文件添加到版本管理中。为什么要有两种规则呢？
想象一个场景：假如我们只需要管理/mtk/目录中的one.txt文件，这个目录中的其他文件都不需要管理，那么.gitignore规则应写为：：
/mtk/*
!/mtk/one.txt
 
假设我们只有过滤规则，而没有添加规则，那么我们就需要把/mtk/目录下除了one.txt以外的所有文件都写出来！
注意上面的/mtk/*不能写为/mtk/，否则父目录被前面的规则排除掉了，one.txt文件虽然加了!过滤规则，也不会生效！
 
----------------------------------------------------------------------------------
还有一些规则如下：
fd1/*
说明：忽略目录 fd1 下的全部内容；注意，不管是根目录下的 /fd1/ 目录，还是某个子目录 /child/fd1/ 目录，都会被忽略；
 
/fd1/*
说明：忽略根目录下的 /fd1/ 目录的全部内容；
 
/*
!.gitignore
!/fw/ 
/fw/*
!/fw/bin/
!/fw/sf/
说明：忽略全部内容，但是不忽略 .gitignore 文件、根目录下的 /fw/bin/ 和 /fw/sf/ 目录；注意要先对bin/的父目录使用!规则，使其不被排除。
```

# 三、 多个远程仓库
## 1、 第一种方式
### # 添加一个远程库，名字不是 origin
```
git remote add repoName https://github.com/your-account/your-repository.git
```
### # 查看版本
```
git remote -v
```
### # pull & push
```
git pull repoName remotebranch:localbranch
git push repoName localbranch:remotebranch
```
## 2、 第二种方式
这样可以同时推送。  
### \# 添加另一个远程库，昵称是 origin
```
git remote set-url --add origin git@gitlab.com:youraccount/your-repo.git
```
### \# 推送
```
git push origin master:master
```

### 3、 删除远程库
```
git remote remove origin
```

# 四、 上传已有项目
1. 在 github 创建一个空项目
1. `git init`
1. `git add .`
1. `git commit -m '提交说明'`
1. `git remote add origin https://github.com/YourAccount/YourRepository.git` - origin是别名，可自定义。
1. `git push -u origin master` - `-u` 是创建上传流，只要在初次提交时用。

# 五、 修改

1. `git add .`
1. `git commit -m 'message'`
1. `git pull 仓库别名 分支` - 多人协作要先 pull，再 merge 解决冲突。
1. `git push 仓库别名 分支` - 默认 origin master。