参考：  
- [Deploying Node.js with systemd](https://rocketeer.be/articles/deploying-node-js-with-systemd/) by Ruben Vermeersch
- [Node 应用的 Systemd 启动](http://www.ruanyifeng.com/blog/2016/03/node-systemd-tutorial.html) by ruanyifeng

## 一、 socket-server.js
```js

require('systemd');
require('autoquit');

var http = require('http');

var server = http.createServer(function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World');
});

server.autoQuit({ timeOut: 60 });
server.listen('systemd');

console.log('Server running at http://0.0.0.0:5000/');
```

- `systemd` - Socket 激活。
- `autoquit` - 指定多少时间无人访问后，关闭 Node 服务。
- `journald` - 向 Systemd 日志添加内容。


## 二、 socket & service
**node-socket-server.socket:**  
```
[Socket]
ListenStream=5000

[Install]
WantedBy=sockets.target
```
**node-socket-server.service:**  
```
[Unit]
Description=node simple server (socket activation)

[Service]
ExecStart=[/path/to/node/executable] [path/to/node-systemd-demo]/socket-server.js
User=[yourUserName]
Group=[yourGroupName]
Environment=PATH=/usr/bin:/usr/local/bin
Environment=NODE_ENV=production
WorkingDirectory=[/path/to/node-systemd-demo]
```
>由于不是开机启动，没有 `[Install]` 区块。  
>由于不需要重启，没有 `Restart` 字段。  

**拷贝文件到 `/etc/systemd/system`：**  
```
$ sudo cp node-socket-server.socket /etc/systemd/system
$ sudo cp node-socket-server.service /etc/systemd/system
```

## 三、 启动 Socket 激活
```
# 启动
$ sudo systemctl daemon-reload
$ sudo systemctl start node-socket-server.socket

# 状态
$ sudo systemctl status node-socket-server.socket
$ sudo systemctl status node-socket-server.service
```

## 四、 停止
```
$ sudo systemctl stop node-socket-server.service
$ sudo systemctl stop node-socket-server.socket
```
