# 在 Linux 系统中设置 Swap 文件

## Step 1: 确定 Swap 不存在

```
free -m
```

运行后可以看到输出：  
```
              total        used        free      shared  buff/cache   available
Mem:            818         162         291           7         365         524
Swap:             0           0           0
```

如果 Swap 的值是 0，可以直接进入 Step 2。否则，运行：  
```
swapon -s
```
如果没有输出，则进入 Step 2。  

## Step 2: 创建 Swap 文件

你需要选择存放文件的地址。本文，将存放在服务器的根目录：  
```
dd if=/dev/zero of=/swapfile count=2048 bs=1M
```

确定创建：  
```
ls / | grep swapfile
```

## Step 3: 激活 Swap 文件

为了安全，确保只有 root 用户能读写 swapfile：  
```
chmod 600 /swapfile
```

确认是否更改权限成功：  
```
ls -lh /swapfile # -h, --human-readable: with -l and -s, print sizes like 1K 234M 2G etc.
```

告诉服务器启动 swap 文件：  
```
mkswap /swapfile
```

## Step 5: 开启 Swap

开启：  
```
swapon /swapfile
```

通过 `free` 确认：  
```
free -m # -m:  以 MB 为单位

total       used       free     shared    buffers     cached
Mem:          1840       1754         86         16         23       1519
-/+ buffers/cache:        210       1630
Swap:         2047          0       2047
```

# Step 5: 自启动

```
nano /etc/fstab
```
在文末添加：  
```
/swapfile   none    swap    sw    0   0
```

「完」  
