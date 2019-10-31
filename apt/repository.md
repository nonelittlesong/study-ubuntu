四个官方库： Main, Universe, Restricted 和 Multiverse。  

参考：  

- [/var/lib/apt/lists is huge](https://askubuntu.com/questions/179955/var-lib-apt-lists-is-huge)  

# 删除
## 1、 删除 repository
删掉不需要的软件。  

删除对应的条目：  
```
sudo vim /etc/apt/sources.list
```

如果已添加 PPA 存储库，查看 `/etc/apt/sources.list.d` 目录并删除相应条目。  
或者，使用命令 `sudo add-apt-repository -r ppa:author/repository` 删除。  

更新 `sudo apt update`。  

## 2、 删除 key
查看 `sudo apt-key list`。  

删除 `sudo apt-key del keyid`。  

更新！  


