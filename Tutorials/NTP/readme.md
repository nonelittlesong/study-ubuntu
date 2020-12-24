# Network Time Protocol

一种用于时间同步的 TCP/IP 协议。

<details>
<summary>References</summary>

- [Ubuntu16.04 配置 NTP](https://www.digitalocean.com/community/tutorials/how-to-configure-ntp-for-use-in-the-ntp-pool-project-on-ubuntu-16-04)
- [Time Synchronization | Ubuntu](https://ubuntu.com/server/docs/network-ntp)
- [Linux下局域网同步时间 | CSDN](https://blog.csdn.net/secondjanuary/article/details/9260637)
- [局域网内两台ubuntu时间同步](https://blog.csdn.net/scx837685002/article/details/80316280?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.control)
- [各 NTP 比较](https://chrony.tuxfamily.org/comparison.html)
- [ufw](https://blog.csdn.net/weixin_34293246/article/details/92148586)

</details>

## 1. timedatectl / timesyncd

>只支持同步时间，不能作为 NTP 服务器

Ubuntu 默认使用 `timedatectl / timesyncd` 同步时间。

如果使用了 chrony，重启电脑 timesyncd 自动关闭。

### 1.1 timedatectl

```
timedatectl [OPTIONS...] COMMAND ...

Query or change system time and date settings.

  -h --help                Show this help message
     --version             Show package version
     --no-pager            Do not pipe output into a pager
     --no-ask-password     Do not prompt for password
  -H --host=[USER@]HOST    Operate on remote host
  -M --machine=CONTAINER   Operate on local container
     --adjust-system-clock Adjust system clock when changing local RTC mode

Commands:
  status                   Show current time settings
  set-time TIME            Set system time
  set-timezone ZONE        Set system time zone
  list-timezones           Show known time zones
  set-local-rtc BOOL       Control whether RTC is in local time
  set-ntp BOOL             Enable or disable network time synchronization
```

### 1.2. timesyncd

```sh
# 重启 timesyncd
$ sudo systemctl restart systemd-timesyncd

# 查看 timesyncd 状态
$ sudo systemctl status systemd-timesyncd
# ● systemd-timesyncd.service - Network Time Synchronization
#    Loaded: loaded (/lib/systemd/system/systemd-timesyncd.service; enabled; vendor preset: enabled)
#   Drop-In: /lib/systemd/system/systemd-timesyncd.service.d
#            └─disable-with-time-daemon.conf
#    Active: active (running) since Wed 2020-12-23 11:55:56 CST; 19min ago
#      Docs: man:systemd-timesyncd.service(8)
#  Main PID: 23706 (systemd-timesyn)
#    Status: "Idle."
#    CGroup: /system.slice/systemd-timesyncd.service
#            └─23706 /lib/systemd/systemd-timesyncd

# Dec 23 11:55:56 song systemd[1]: Starting Network Time Synchronization...
# Dec 23 11:55:56 song systemd[1]: Started Network Time Synchronization.
# Dec 23 11:55:56 song systemd-timesyncd[23706]: Synchronized to time server 10.205.56.84:123 (10.205.56.84).
# Dec 23 12:00:55 song systemd-timesyncd[23706]: Timed out waiting for reply from 10.205.56.84:123 (10.205.56.84).
# Dec 23 12:03:14 song systemd-timesyncd[23706]: Timed out waiting for reply from 10.205.56.84:123 (10.205.56.84).
```

## 2. chrony

Ubuntu 推荐使用 chrony。

- [Frequently Asked Questions | chrony](https://chrony.tuxfamily.org/faq.html)
- [Using chrony to configure NTP | ubuntu](https://ubuntu.com/blog/ubuntu-bionic-using-chrony-to-configure-ntp)

### 2.1. 安装

```
$ sudo apt install chrony
```

提供两个执行文件：

- `chronyd` — 守护进程，同步和服务 NTP。
- `chronyc` — 命令行。

### 2.2. chrony server

编辑配置文件：`sudo vim /etc/chrony/chrony.conf`

```conf
# 开启 NTP 服务器没同步的情况下，为局域网提供时间服务
local stratum 10

# 允许访问的客户端
allow 10.205.56.200

# 设置直接改动系统时间的阈值
makestep 1.0 3
```

### 2.3. chrony client

由于 ubuntu16.04 timesyncd 的功能不够完善，使用 chrony 配置客户端。

```conf
# 注释掉默认的 server
#pool 2.debian.pool.ntp.org offline iburst

```