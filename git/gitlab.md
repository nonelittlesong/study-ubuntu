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

- https://stackoverflow.com/questions/25785903/gitlab-7-2-1-with-apache-server-instead-of-nginx

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
```
5、 [Download the right web server configs](https://gitlab.com/gitlab-org/gitlab-recipes/tree/master/web-server)  
```
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo vim /etc/apache2/sites-available/gitlab.conf
```
```
# This configuration has been tested on GitLab 8.2
# Note this config assumes unicorn is listening on default port 8080 and
# gitlab-workhorse is listening on port 8181. To allow gitlab-workhorse to
# listen on port 8181, edit /etc/gitlab/gitlab.rb and change the following:
#
# gitlab_workhorse['listen_network'] = "tcp"
# gitlab_workhorse['listen_addr'] = "127.0.0.1:8181"
#
#Module dependencies
# mod_rewrite
# mod_proxy
# mod_proxy_http
<VirtualHost *:80>
  ServerName YOUR_SERVER_FQDN
  ServerSignature Off

  ProxyPreserveHost On

  # Ensure that encoded slashes are not decoded but left in their encoded state.
  # http://doc.gitlab.com/ce/api/projects.html#get-single-project
  AllowEncodedSlashes NoDecode

  <Location />
    # New authorization commands for apache 2.4 and up
    # http://httpd.apache.org/docs/2.4/upgrading.html#access
    Require all granted

    #Allow forwarding to gitlab-workhorse
    ProxyPassReverse http://127.0.0.1:8181
    ProxyPassReverse http://YOUR_SERVER_FQDN/
  </Location>

  # Apache equivalent of nginx try files
  # http://serverfault.com/questions/290784/what-is-apaches-equivalent-of-nginxs-try-files
  # http://stackoverflow.com/questions/10954516/apache2-proxypass-for-rails-app-gitlab
  RewriteEngine on

  #Forward all requests to gitlab-workhorse except existing files like error documents
  RewriteCond %{DOCUMENT_ROOT}/%{REQUEST_FILENAME} !-f [OR]
  RewriteCond %{REQUEST_URI} ^/uploads/.*
  RewriteRule .* http://127.0.0.1:8181%{REQUEST_URI} [P,QSA,NE]

  # needed for downloading attachments
  DocumentRoot /opt/gitlab/embedded/service/gitlab-rails/public

  #Set up apache error documents, if back end goes down (i.e. 503 error) then a maintenance/deploy page is thrown up.
  ErrorDocument 404 /404.html
  ErrorDocument 422 /422.html
  ErrorDocument 500 /500.html
  ErrorDocument 502 /502.html
  ErrorDocument 503 /503.html

  # It is assumed that the log directory is in /var/log/httpd.
  # For Debian distributions you might want to change this to
  # /var/log/apache2.
  LogFormat "%{X-Forwarded-For}i %l %u %t \"%r\" %>s %b" common_forwarded
  ErrorLog /var/log/httpd/logs/YOUR_SERVER_FQDN_error.log
  CustomLog /var/log/httpd/logs/YOUR_SERVER_FQDN_forwarded.log common_forwarded
  CustomLog /var/log/httpd/logs/YOUR_SERVER_FQDN_access.log combined env=!dontlog
  CustomLog /var/log/httpd/logs/YOUR_SERVER_FQDN.log combined

</VirtualHost>
```
