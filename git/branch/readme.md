# Branch
Git 中，和 branch 相关的操作。  

```sh
# <> 表示必要的参数

# --------- 查看分支 ---------
# 只查看本地分支
$ git branch
# 查看本地和远程分支
$ git branch -a

# --------- 删除分支 ---------
# 删除本地分支
$ git branch -d <branchName> # 你不能处于 branchName 分支中
# 删除远程分支
$ git push origin --delete <branchName>

# --------- 添加分支 ---------
# 添加本地分支
$ git checkout -b <childBranch> <parentBranch>
# 关联远程分支
$ git push origin <localBranch>:<remoteBranch> # 只写 localBranch，默认 remoteBranch 和 localBranch 同名

# --------- 克隆分支 ---------
$ git clone -b <branchName> https://github.com/username/repositoryname.git
```
