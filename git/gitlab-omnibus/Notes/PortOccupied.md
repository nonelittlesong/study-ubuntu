# 端口占用
查看被占用的端口号：  
```
netstat -pant | grep 端口号
```

修改一下内容`sudo vim /etc/gitlab/gitlab.rb`：  
```rb
grafana['http_port'] = 8086

unicorn['port'] = 8081
```
重启：  
```
sudo gitlab-ctl reconfigure
sudo gitlab-ctl restart
```
