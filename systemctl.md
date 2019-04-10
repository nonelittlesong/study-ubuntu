https://blog.csdn.net/qq_29663071/article/details/80814081  

1、 服务文件
例如nginx的服务文件：  
```
[Unit]
Description=nginx - high performance web server
Documentation=https://nginx.org/en/docs/
After=network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target 

[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID 

[Install] 
WantedBy=multi-user.target
```
**\[Uint]**  
Description: 服务的简单描述。  
Documentation: 服务文档。  
Before/After： 定义启动顺序。Defore=xxx.service代表在xxx.service之前启动。After=xxx.service代表在xxx.service之后启动。  
Requires： 这个单元启动了，他需要的单元也会被启动;它需要的单元停止了，这个单元也停止。  
Wants： 推荐使用。这个单元启动了，它需要的单元也会被启动。它需要的单元停止了，对本单元没有影响。  

**\[Service]**  
Type=simple(默认): systemd认为该服务将立即启动。服务进程不会fork。如果该服务要启动其他服务，不要使用此类型，除非该服务是socket激活型。  
Type=forking: systemd认为该服务进程fork，且父进程退出后服务启动成功。对于常规的守护进程（daemon），除非你确定此启动方式无法满足需求，使用此类型启动即可。使用此启动类型应同时指定 PIDFile=，以便systemd能够跟踪服务的主进程。  
Type=oneshot： 这一选项适用于只执行一项任务、随后立即退出的服务。可能需要同时设置 RemainAfterExit=yes 使得 systemd 在服务进程退出之后仍然认为服务处于激活状态。  
Type=notify： 与 Type=simple 相同，但约定服务会在就绪后向 systemd 发送一个信号。这一通知的实现由 libsystemd-daemon.so 提供。  
Type=dbus： 若以此方式启动，当指定的 BusName 出现在DBus系统总线上时，systemd认为服务就绪。  
Type=idle: systemd会等待所有任务(Jobs)处理完成后，才开始执行idle类型的单元。除此之外，其他行为和Type=simple 类似。  
PIDFile： pid文件路径。  
ExecStart: 指定启动单元的命令或者脚本， ExecStartPre和ExecStartPost指定在ExecStart之前或者之后执行的脚本。  
ExecReload： 指定单元reload时执行的命令或脚本。  
ExecStop： 指定单元停止时执行的命令或脚本。  

**\[Install]**  
WantedBy: 单元被允许运行需要的弱依赖单元。  

2、 重载服务
systemctl enable nginx.service 设置开机自启， 就会在 /etc/systemd/system/multi-user.target.wants/ 目录下新建一个 /usr/lib/systemd/system/nginx.service 文件的链接。  

3、 操作服务
刚刚配置的服务需要让systemctl能识别，就必须刷新配置：  
```
$ systemctl daemon-reload
```
* 启动一个服务：systemctl start nginx.service  
* 关闭一个服务：systemctl stop postfix.service  
* 重启一个服务：systemctl restart nginx.service  
* 显示一个服务的状态：systemctl status postfix.service  
* 在开机时启用一个服务：systemctl enable nginx.service  
* 在开机时禁用一个服务：systemctl disable nginx.service  
* 查看服务是否开机启动：systemctl is-enabled nginx.service  
* 查看已启动的服务列表：systemctl list-unit-files|grep enabled  
* 查看启动失败的服务列表：systemctl --failed  
