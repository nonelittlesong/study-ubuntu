## Github 域名被劫持
首先 `ping github.com`，查看 ip 地址是否正确。  

登录 [ipaddress.com](https://www.ipaddress.com/)：  
查看 [github.com](https://github.com.ipaddress.com/) 和 [github.global.ssl.fastly.net](https://fastly.net.ipaddress.com/github.global.ssl.fastly.net) 的真实 ip。  

编辑 `sudo vim /etc/hosts`，在末尾添加：  
```
## ip 替换成你查到的真实 ip
192.30.253.112 github.com
199.232.5.194 github.global.ssl.fastly.net
```

重启网络 `sudo systemctl restart networking.service`。  

