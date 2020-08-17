```
dpkg [option...] action
```

options:  

- `-P, --purge package...|-a|--pending` - 移除软件包，不保留配置。  


## [dpkg 前端被锁](https://blog.csdn.net/weixin_44090305/article/details/94651804)
```diff
- dpkg: error: dpkg frontend is locked by another process
```
解决方案：  
```sh
rm /var/lib/dpkg/lock
rm /var/lib/dpkg/lock-frontend
rm /var/cache/apt/archives/lock
```
