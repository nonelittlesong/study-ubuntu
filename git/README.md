
- 克隆指定分支 `git clone -b v2 https://github.com/ant-design/ant-design-pro.git`  


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

# 二、 多个远程仓库
## 1、 第一种方式
**添加一个远程库，名字不是 origin:**  
```
git remote add repoName https://github.com/your-account/your-repository.git
# 修改
# $ git remote set-url origin https://github.com/USERNAME/REPOSITORY.git
```
**查看版本:**  
```
git remote -v
```
**pull & push:**  
```
git pull repoName remotebranch:localbranch
git push repoName localbranch:remotebranch
```
## 2、 第二种方式
这样可以同时推送。  
**添加另一个远程库，昵称是 origin:**  
```
git remote set-url --add origin git@gitlab.com:youraccount/your-repo.git
```
**推送:**  
```
git push origin master:master
```

## 3、 删除远程库
```
git remote remove origin
```

# 四、 上传已有项目
```
# 在 github 创建一个空项目
git init
git add .
git commit -m '提交说明'
git remote add origin https://github.com/YourAccount/YourRepository.git  # origin是别名，可自定义。
git push -u origin master                                                # -u 是创建默认上传流，只要在初次提交时用。
```

# 五、 修改

1. `git add .`
1. `git commit -m 'message'`
1. `git pull 仓库别名 分支` - 多人协作要先 pull，再 merge 解决冲突。
1. `git push 仓库别名 分支` - 默认 origin master。
