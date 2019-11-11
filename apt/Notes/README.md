## Hash Sum mismatch

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
   
