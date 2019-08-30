# 端口占用
```
sudo vim /etc/gitlab/gitlab.rb
```
修改一下内容：  
```rb
grafana['http_port'] = 8086

unicorn['port'] = 8081
```
重启：  
```
sudo gitlab-ctl regonfigure
sudo gitlab-ctl restart
```
