- [Gitlab Docs](https://docs.gitlab.com/)
- [Install GitLab on Ubuntu 14.04 using Apache2](https://paulshipley.id.au/blog/coding-tips/install-gitlab-on-ubuntu-14-04-using-apache2/)
- [Apache Docs](http://httpd.apache.org/docs/)
- [PostgreSQL](https://www.postgresql.org/) [Runoob](https://www.runoob.com/postgresql/postgresql-tutorial.html)


# 一、 Start
## 1、 依赖
```
sudo apt update
sudo apt install curl openssh-server ca-certificates
sudo apt install postfix
```

## 2、 [清华 Gitlab 镜像](https://mirror.tuna.tsinghua.edu.cn/help/gitlab-ce/)
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
[Download the right web server configs](https://gitlab.com/gitlab-org/gitlab-recipes/tree/master/web-server)  
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
```
sudo ln -sf /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled
sudo ln -sf /etc/apache2/mods-available/proxy_http.load /etc/apache2/mods-enabled
sudo ln -sf /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled
systemctl restart apache2
mv /var/www/html/index.html /var/www/html/index.html.bak
```

nginx:  
```
## GitLab
##
## Modified from nginx http version
## Modified from http://blog.phusion.nl/2012/04/21/tutorial-setting-up-gitlab-on-debian-6/
## Modified from https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
##
## Lines starting with two hashes (##) are comments with information.
## Lines starting with one hash (#) are configuration parameters that can be uncommented.
##
##################################
##        CONTRIBUTING          ##
##################################
##
## If you change this file in a Merge Request, please also create
## a Merge Request on https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests
##
###################################
##         configuration         ##
###################################
##
## See installation.md#using-https for additional HTTPS configuration details.

upstream gitlab-workhorse {
  server unix:/var/opt/gitlab/gitlab-workhorse/socket fail_timeout=0;
}

## Redirects all HTTP traffic to the HTTPS host
server {
  ## Either remove "default_server" from the listen line below,
  ## or delete the /etc/nginx/sites-enabled/default file. This will cause gitlab
  ## to be served if you visit any address that your server responds to, eg.
  ## the ip address of the server (http://x.x.x.x/)
  listen 0.0.0.0:80;
  listen [::]:80 ipv6only=on default_server;
  server_name YOUR_SERVER_FQDN; ## Replace this with something like gitlab.example.com
  server_tokens off; ## Don't show the nginx version number, a security best practice
  return 301 https://$http_host$request_uri;
  access_log  /var/log/nginx/gitlab_access.log;
  error_log   /var/log/nginx/gitlab_error.log;
}

## HTTPS host
server {
  listen 0.0.0.0:443 ssl;
  listen [::]:443 ipv6only=on ssl default_server;
  server_name YOUR_SERVER_FQDN; ## Replace this with something like gitlab.example.com
  server_tokens off; ## Don't show the nginx version number, a security best practice
  root /opt/gitlab/embedded/service/gitlab-rails/public;

  ## Strong SSL Security
  ## https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html & https://cipherli.st/
  ssl on;
  ssl_certificate /etc/nginx/ssl/gitlab.crt;
  ssl_certificate_key /etc/nginx/ssl/gitlab.key;

  # GitLab needs backwards compatible ciphers to retain compatibility with Java IDEs
  ssl_ciphers "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA:ECDHE-RSA-AES128-SHA:ECDHE-RSA-DES-CBC3-SHA:AES256-GCM-SHA384:AES128-GCM-SHA256:AES256-SHA256:AES128-SHA256:AES256-SHA:AES128-SHA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!MD5:!PSK:!RC4";
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_session_cache shared:SSL:10m;
  ssl_session_timeout 5m;

  ## See app/controllers/application_controller.rb for headers set

  ## [Optional] Enable HTTP Strict Transport Security
  ## HSTS is a feature improving protection against MITM attacks
  ## For more information see: https://www.nginx.com/blog/http-strict-transport-security-hsts-and-nginx/
  # add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";

  ## [Optional] If your certficate has OCSP, enable OCSP stapling to reduce the overhead and latency of running SSL.
  ## Replace with your ssl_trusted_certificate. For more info see:
  ## - https://medium.com/devops-programming/4445f4862461
  ## - https://www.ruby-forum.com/topic/4419319
  ## - https://www.digitalocean.com/community/tutorials/how-to-configure-ocsp-stapling-on-apache-and-nginx
  # ssl_stapling on;
  # ssl_stapling_verify on;
  # ssl_trusted_certificate /etc/nginx/ssl/stapling.trusted.crt;
  # resolver 208.67.222.222 208.67.222.220 valid=300s; # Can change to your DNS resolver if desired
  # resolver_timeout 5s;

  ## [Optional] Generate a stronger DHE parameter:
  ##   sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 4096
  ##
  # ssl_dhparam /etc/ssl/certs/dhparam.pem;

  ## Individual nginx logs for this GitLab vhost
  access_log  /var/log/nginx/gitlab_access.log;
  error_log   /var/log/nginx/gitlab_error.log;

  location / {
    client_max_body_size 0;
    gzip off;

    ## https://github.com/gitlabhq/gitlabhq/issues/694
    ## Some requests take more than 30 seconds.
    proxy_read_timeout      300;
    proxy_connect_timeout   300;
    proxy_redirect          off;

    proxy_http_version 1.1;

    proxy_set_header    Host                $http_host;
    proxy_set_header    X-Real-IP           $remote_addr;
    proxy_set_header    X-Forwarded-Ssl     on;
    proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
    proxy_set_header    X-Forwarded-Proto   $scheme;
    proxy_pass http://gitlab-workhorse;
  }
}
```
