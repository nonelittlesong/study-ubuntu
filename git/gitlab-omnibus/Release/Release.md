
- [How to store releases/binaries in GitLab?](https://stackoverflow.com/questions/29013457/how-to-store-releases-binaries-in-gitlab)

# 创建标签
```
git tag -a MY_TAG_NAME 30728cab -m 'version v1.0.0'
git push REMOTE_REPO_NAME REMOTE_BRANCH_NAME MY_TAG_NAME
```

# 上传文件
```
curl --request POST --header "PRIVATE-TOKEN: <your_access_token>" --form "file=@/path/to/your/file" https://gitlab.example.com/api/v4/projects/1/uploads
```
