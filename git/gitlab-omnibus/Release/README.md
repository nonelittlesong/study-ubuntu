
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

# 创建 release
```
curl --request POST --header 'Content-Type: application/json' --header "Private-Token: YOUR_PRIVATE_TOKEN" --data '{"name": "MY_RELEASE_NAME", "tag_name": "MY_TAG_NAME", "description": "Release with the binary LINK_TO_YOUR_BINARY"}' "https://MY_GITLAB_HOSTING.COM/api/v4/projects/MY_PROJECT_ID/releases"
```
或者：  
```sh
#!/bin/bash

RELEASE_NAME="$1"
TAG_NAME="$2"
PROJECT_ID="$3"
DESCRIPTION_FILE_PATH="$4"
PRIVATE_TOKEN="$5"

if [ "$5" == "" ]; then
    echo "Missing parameter! Parameters are RELEASE_NAME, TAG_NAME, PROJECT_ID, DESCRIPTION_FILE_PATH and PRIVATE_TOKEN.";
    exit 1;
fi

DESCRIPTION=''

# Load data from file
while read -r line; do
    DESCRIPTION="${DESCRIPTION}${line}\n";
done < "${DESCRIPTION_FILE_PATH}"

curl --request POST\
     --header 'Content-Type: application/json'\
     --header "Private-Token: ${PRIVATE_TOKEN}"\
     --data-binary "{\"name\": \"${RELEASE_NAME}\", \"tag_name\": \"${TAG_NAME}\", \"description\": \"${DESCRIPTION}\"}"\
     "https://MY_GITLAB_HOSTING.com/api/v4/projects/${PROJECT_ID}/releases" 

echo
```

# 删除
```
curl --request DELETE --header "Private-Token: MY_PRIVATE_TOKEN" "https://MY_GITLAB_HOSTING.com/api/v4/projects/MY_PROJECT_ID/releases/MY_TAG_NAME"
```
或者：  
```
#!/bin/bash

PROJECT_ID=$1
TAG_NAME=$2
PRIVATE_TOKEN=$3

if [ "$3" == "" ]; then
    echo "Missing parameter! Parameters are PROJECT_ID, TAG_NAME and PRIVATE_TOKEN.";
    exit 1;
fi

curl --request DELETE --header "Private-Token: ${PRIVATE_TOKEN}" "https://MY_GITLAB_HOSTING.com/api/v4/projects/${PROJECT_ID}/releases/${TAG_NAME}"

echo
```
