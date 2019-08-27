# Start
## 1、依赖
```
sudo apt update
sudo apt install curl openssh-server ca-certificates
sudo apt install postfix
```

## 2、[清华 Gitlab 镜像](https://mirror.tuna.tsinghua.edu.cn/help/gitlab-ce/)
首先信任 GitLab 的 GPG 公钥:  
```
curl https://packages.gitlab.com/gpg.key 2> /dev/null | sudo apt-key add - &>/dev/null
```
再选择你的 Debian/Ubuntu 版本，文本框中内容写进 `/etc/apt/sources.list.d/gitlab-ce.list`:  
```
deb https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/ubuntu xenial main
```
安装 gitlab-ce:  
```
sudo apt-get update
sudo apt-get install gitlab-ce
```

