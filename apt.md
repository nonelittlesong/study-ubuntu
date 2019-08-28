# apt & apt-get

| apt | apt-get | 功能 |
| --- | --- | --- |
| apt install | apt-get install | 安装 |
| apt remove | apt-get remove | 移除 |
| apt purge | apt-get purge | 移除软件包及配置文件 |
| apt upgrade | apt-get upgrade | 升级 |
| apt autoremove | apt-get autoremove | 自动删除不需要的包 |
| apt full-upgrade | apt-get dist-upgrade | 升级时自动处理依赖关系 |
| apt search | apt-cache search | 搜索应用程序 |
| apt show | apt-cache show | 显示安装细节 |
| apt list | - | 列出包含条件的包（已安装，可升级） |
| apt edit-sources | - | 编辑源列表 |

- apt 可以看作 `apt-get` 和 `apt-cache` 的子集。
