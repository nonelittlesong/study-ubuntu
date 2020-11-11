
## 一、 Troubleshootings

### 1.1 Hash Sum Mismatch
参考：  
- [apt-get update更新源时，出现“Hash Sum mismatch”问题](https://www.cnblogs.com/kevingrace/p/6083854.html)  

系统环境：  
- Ubuntu 16.04
- NVIDIA-SMI 390.30
- Date 11/11/2019

运行 `sudo apt-get update`，出错：  
```diff
- E: Failed to fetch https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/Packages.gz  Hash Sum mismatch
- E: Some index files failed to download. They have been ignored, or old ones used instead.
```

原因分析：  
所使用的网络供应商，有些会设置一些透明缓存，以增加网络内部速度，减少出口的流量，所获取的某些文件不是源服务器上的真正文件，是从缓存中获取的，当缓存中获取的一些校验信息跟源中不一致的时候，自然提示校验失败，无法继续更新。  

解决方案：  

1. 删掉 `/var/lib/apt/lists` 目录下的所有文件  
   `sudo rm -rf /var/lib/apt/lists/*`  
2. 新建文件夹  
   `sudo mkdir /var/lib/apt/lists/partial`  
3. 更新  
   `sudo apt-get update`  

```diff
! 经测试，不能在所有情况下解决问题
```

### 1.2 Public Key is not Available
参考：  
- [Public Key is not available | stackoverflow](https://stackoverflow.com/questions/39719830/public-key-is-not-available)  
- https://blog.csdn.net/smileindark/article/details/105464928  

```diff
- Err:11 https://download.sublimetext.com apt/stable/ InRelease                                                          
-   The following signatures couldn't be verified because the public key is not available: NO_PUBKEY F57D4F59BD3DF454
```

解决：  
```sh
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys <key number> # (这个公钥根据提示来写的)
# 或者
$ sudo gpg --keyserver keyserver.ubuntu.com --recv <key number>
$ sudo gpg --export --armor <key number> | sudo apt-key add -

$ sudo apt-get update
```

### 1.3 Key Expired
参考：  
- https://askubuntu.com/questions/650032/gpg-errorthe-following-signatures-were-invalid-keyexpired  

问题：  
```diff
- The following signatures were invalid: KEYEXPIRED
```

解决：  
```sh
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --refresh-keys
```
