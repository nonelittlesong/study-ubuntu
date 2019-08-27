本文链接： https://blog.csdn.net/guxch/article/details/7041052  

# 一、概述
由 socket 发展起来的同一主机的进程间通讯（IPC）。  

两种工作模式：  

1. `SOCK_DGRAM`
2. `SOCK_STREAM`

# 二、工作流程
与网络socket的不同点：  

1. address family 是 `AF_UNIX`。
2. 不使用 ip 和 port，使用文件路径。
3. 地址格式不同。 UNIX Domain Socket 用结构体 `sockaddr_un` 表示，是一个 socket 类型的文件在文件系统中的路径，这个 socket 文件由 bind() 调用创建，如果调用 bind() 时该文件已存在，则 bind() 错误返回。
4. UNIX Domain Socket 客户端一般要显式调用 bind 函数，而不象网络 socket 一样依赖系统自动分配的地址。客户端 bind 的 socket 文件名可以包含客户端的 pid ，这样服务器就可以区分不同的客户端。

工作流程：  

- 服务器端 >> 创建 socket -> 绑定文件（端口） -> 监听 -> 接受客户端连接 -> 接收/发送数据 -> ... -> 关闭。
- 客户端 >> 创建 socket -> 绑定文件 -> 连接 -> 发送/接收数据 -> ... -> 关闭。

