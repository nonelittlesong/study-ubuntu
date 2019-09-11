参考：  

- [Node 应用的 Systemd 启动](http://www.ruanyifeng.com/blog/2016/03/node-systemd-tutorial.html) by ruanyifeng

## 一、 node-server.service
查看系统信息：  
```
# node executable path
$ which node

# your user name
$ id -un

# your group name
$ id -gn
```

node-server.service:  
```
[Unit]
Description=node simple server

[Service]
ExecStart=[/path/to/node/executable] [path/to/node-systemd-demo]/server.js
Restart=always
User=[yourUserName]
Group=[yourUserGroup]
Environment=PATH=/usr/bin:/usr/local/bin
Environment=NODE_ENV=production
WorkingDirectory=[/path/to/node-systemd-demo]

[Install]
WantedBy=multi-user.target
```

- \[Service]
  - Restart - 如何重启。 `always` 表示如果程序退出，总是重启。
- \[Install]
  - WantedBy - 开机启动需要设为 `multi-user.target`。
  
## 二、 服务
```
# 拷贝配置文件到 /etc/systemd/system 中
$ sudo cp node-server.service /etc/systemd/system

# 重载配置文件
$ sudo systemctl daemon-reload

# 启动服务
$ sudo systemctl start node-server

# 查看状态
$ sudo systemctl status node-server

# 查看日志
$ sudo journalctl -u node-server

# 实时输出最新日志
$ sudo journalctl --follow -u node-server

# 重启服务
$ sudo systemctl restart node-server

# 停止服务
$ sudo systemctl stop node-server

# 开机启动
$ sudo systemctl enable node-server
```

