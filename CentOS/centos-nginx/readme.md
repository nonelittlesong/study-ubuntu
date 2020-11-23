# [CentOS 8 用源码安装 Nginx](https://www.vultr.com/docs/how-to-install-nginx-from-source-on-centos-8)

<details>
<summary>Prerequisites</summary>

- 一个 [full updated](https://www.vultr.com/docs/how-to-update-centos-linux) 的 CentOS 8 服务器
- 一个 non-root [sudo 用户](https://www.vultr.com/docs/create-a-sudo-user-on-centos)

</details>

## 1. 安装开发工具

```
$ sudo dnf groupinstall 'Development Tools'
$ sudo dnf install epel-release
$ sudo dnf install wget
```

## 2. 下载 Nginx 源码

访问 [Nginx 下载页面](https://nginx.org/en/download.html)并复制最新的 Mainline 版的 URL，下载：  
```
$ mkdir -p /tmp/nginxinstallation
$ cd /tmp/nginxinstallation/
$ wget https://nginx.org/download/nginx-1.19.1.tar.gz && tar zxvf nginx-*
```

## 3. 下载依赖

```
$ wget https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.gz && tar zxvf pcre-*
$ wget https://www.zlib.net/zlib-1.2.11.tar.gz && tar zxvf zlib-*
$ wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz && tar zxvf openssl-*
```

## 4. 安装可选依赖

```
$ sudo dnf install perl perl-devel perl-ExtUtils-Embed libxslt libxslt-devel libxml2 libxml2-devel gd gd-devel GeoIP GeoIP-devel gperftools-devel
```

## 5. 创建 Nginx 用户

```
$ adduser nginx --system --no-create-home --shell /bin/false --user-group
```

## 6. 编译

<details>
<summary>命令选项</summary>
以下选项是必需的。  

- --prefix= the directory for Nginx configuration files.
- --sbin-path= the path for the Nginx binary.
- --pid-path= the path for the Nginx pidfile.
- --lock-path= the path for the Nginx lockfile.
- --conf-path= the path for the Nginx configuration file.
- --modules-path= the path for Nginx modules.
- --error-log-path= the path for the error log file.
- --http-log-path= the path for the access log file.
- --user= the user name for worker processes.
- --group= the group name for worker processes.
- --with-pcre= the path for the PCRE source code library.
- --with-pcre-jit= PCRE will be used in just-in-time compilation mode.
- --with-zlib= the path for the zlib source code library.
- --with-openssl= the path ofor the openssl source code library.

</details>

[可选设置查看此链接](https://www.vultr.com/docs/how-to-install-nginx-from-source-on-centos-8)

### Cofigure

```
$ cd nginx-1.18.0
$ sudo ./configure \
--prefix=/etc/nginx \
--sbin-path=/usr/sbin/nginx \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--conf-path=/etc/nginx/nginx.conf \
--modules-path=/etc/nginx/modules \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--user=nginx \
--group=nginx \
--with-pcre=../pcre-8.44 \
--with-pcre-jit \
--with-zlib=../zlib-1.2.11 \
--with-openssl=../openssl-1.1.1g \
--with-http_ssl_module \
--with-http_v2_module \
--with-threads \
--with-file-aio \
--with-http_degradation_module \
--with-http_auth_request_module \
--with-http_geoip_module \
--with-http_realip_module \
--with-http_secure_link_module \
--with-cpp_test_module \
--with-debug \
--with-google_perftools_module \
--with-mail \
--with-mail_ssl_module \
--with-http_mp4_module \
--with-http_flv_module \
--with-stream \
--with-stream_ssl_module \
--with-stream_ssl_preread_module \
--with-http_dav_module \
--with-http_image_filter_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_addition_module \
--with-http_random_index_module \
--with-http_slice_module \
--with-http_sub_module \
--with-http_xslt_module \
--with-select_module \
--with-poll_module 
$ sudo make 
$ sudo make install
```

## 7. 创建系统服务

1. 编辑服务文件
   ```
   $ sudo nano /etc/systemd/system/nginx.service
   ```
2. 复制以下内容并保存
   ```
   [Unit]
   Description=The NGINX HTTP and reverse proxy server
   After=syslog.target network-online.target remote-fs.target nss-lookup.target
   Wants=network-online.target

   [Service]
   Type=forking
   PIDFile=/var/run/nginx.pid
   ExecStartPre=/usr/sbin/nginx -t
   ExecStart=/usr/sbin/nginx
   ExecReload=/usr/sbin/nginx -s reload
   ExecStop=/bin/kill -s QUIT $MAINPID
   PrivateTmp=true

   [Install]
   WantedBy=multi-user.target
   ```
3. 重载系统守护进程
   ```
   $ sudo systemctl daemon-reload
   ```
4. Enable 服务
   ```
   $ systemctl enable nginx.service
   ```
5. 启动 Nginx
   ```
   $ sudo service nginx start
   ```
6. 确认 Nginx正在运行
   ```
   $ sudo service nginx status
   ```
   
## 8. 配置防火墙

```
$ firewall-cmd --zone=public --permanent --add-service=http
$ firewall-cmd --zone=public --permanent --add-service=https
$ firewall-cmd --reload
```

「完」
