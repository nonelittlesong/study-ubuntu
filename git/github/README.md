## Github 域名被劫持
首先 `ping github.com`，查看 ip 地址是否正确。  

登录 [ipaddress.com](https://www.ipaddress.com/)：  
查看的真实 ip：  
[github.com](https://github.com.ipaddress.com/)  
[github.global.ssl.fastly.net](https://fastly.net.ipaddress.com/github.global.ssl.fastly.net)  
[help.github.com](https://github.com.ipaddress.com/help.github.com)  

编辑 `sudo vim /etc/hosts`，在末尾添加：  
```
## ip 替换成你查到的真实 ip
192.30.253.112 github.com
199.232.5.194 github.global.ssl.fastly.net
185.199.108.154 help.github.com
140.82.114.20 gist.github.com
```

重启网络 `sudo systemctl restart networking.service`。  

## SMS
```js
var option = new Option("China +86","+86");
option.selected = true;
document.getElementById('countrycode').options.add(option, 0);
```
