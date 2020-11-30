```
dpkg [option...] action
```

options:  

- `-P, --purge package...|-a|--pending` — 移除软件包，不保留配置。  
- `-l|--list [<pattern> ...]` — 简明地列出软件包。  
  ```
  song@song-TM1604:~$ dpkg -l
  Desired=Unknown/Install/Remove/Purge/Hold
  | Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
  |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
  ||/ Name                     Version           Architecture      Description
  +++-========================-=================-=================-=====================================================
  ii  a11y-profile-manager-ind 0.1.10-0ubuntu3   amd64             Accessibility Profile Manager - Unity desktop indicat
  ii  account-plugin-facebook  0.12+16.04.201601 all               GNOME Control Center account plugin for single signon
  ii  account-plugin-flickr    0.12+16.04.201601 all               GNOME Control Center account plugin for single signon
  ···
  ```

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
