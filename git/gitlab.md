- [Gitlab Docs](https://docs.gitlab.com/)
- [Install GitLab on Ubuntu 14.04 using Apache2](https://paulshipley.id.au/blog/coding-tips/install-gitlab-on-ubuntu-14-04-using-apache2/)

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

## 3、 [使用非绑定 web 服务器](https://docs.gitlab.com/omnibus/settings/nginx.html#using-a-non-bundled-web-server)
`sudo vim /etc/gitlab/gitlab.rb`:  

```rb
# 1. Disable bundled Nginx
nginx['enable'] = false

# 2. Set the username of the non-bundled web-server user
# For Debian/Ubuntu the default user is www-data for both Apache/Nginx, whereas for RHEL/CentOS the Nginx user is nginx.
web_server['external_users'] = ['www-data']

# 3. （可选） 代理
gitlab_rails['trusted_proxies'] = [ '192.168.1.0/24', '192.168.2.1', '2001:0db8::/32' ]

# 4. （可选） Set the right gitlab-workhorse settings if using Apache
gitlab_workhorse['listen_network'] = "tcp"
gitlab_workhorse['listen_addr'] = "127.0.0.1:8181"

# 5. Download the right web server configs
```
