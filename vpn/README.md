# 科学上网

<details>
<summary>References</summary>

- https://github.com/hwdsl2/setup-ipsec-vpn  
- https://github.com/Nyr/openvpn-install  
- [Ubuntu 16.04 Connecting to L2TP over IPSEC via Network Manager](https://hkdb.medium.com/ubuntu-16-04-connecting-to-l2tp-over-ipsec-via-network-manager-204b5d475721)

</details>

## 1. OpenVPN 客户端

>ubuntu16 的 openvpn 版本是 2.3！！ 

:warning: 我没有 OpenVPN 的服务器，没有测试过

```sh
$ sudo apt install openvpn
$ openvpn --version
```

将服务器的配置文件（.ovpn）复制到客户端 `/etc/openvpn` 中。  

## 2. IPsec

### 2.1. 服务端

```sh
wget https://git.io/vpnsetup-centos -O vpnsetup.sh && sh vpnsetup.sh

# 更新
ipsec --version
wget https://git.io/vpnupgrade-centos -O vpnupgrade.sh
```

#### 账户管理

- **添加或更改一个 VPN 用户**  
  ```
  # 下载脚本
  wget -O add_vpn_user.sh https://raw.githubusercontent.com/hwdsl2/setup-ipsec-vpn/master/extras/add_vpn_user.sh
  # 所有的变量值必须用 '单引号' 括起来
  # *不要* 在值中使用这些字符： \ " '
  sudo bash add_vpn_user.sh 'username_to_add' 'password_to_add'
  ```
- **删除一个 VPN 用户**  
  ```
  # 下载脚本
  wget -O del_vpn_user.sh https://raw.githubusercontent.com/hwdsl2/setup-ipsec-vpn/master/extras/del_vpn_user.sh
  # 所有的变量值必须用 '单引号' 括起来
  # *不要* 在值中使用这些字符： \ " '
  sudo bash del_vpn_user.sh 'username_to_delete'
  ```
- **更新所有的 VPN 用户** — 移除所有的用户并替换成你指定的用户  
  ```
  # 下载脚本
  wget -O update_vpn_users.sh https://raw.githubusercontent.com/hwdsl2/setup-ipsec-vpn/master/extras/update_vpn_users.sh
  ```
  1. **选项1：** 编辑脚本并输入用户信息  
     ```
     nano -w update_vpn_users.sh
     [替换为你自己的值： YOUR_USERNAMES 和 YOUR_PASSWORDS]
     sudo sh update_vpn_users.sh
     ```
  2. **选项2：** 将 VPN 用户信息定义为环境变量  
     ```
     # VPN用户名和密码列表，用空格分隔
     # 所有变量值必须用 '单引号' 括起来
     # *不要* 在值中使用这些字符：  \ " '
     sudo \
     VPN_USERS='用户名1 用户名2 ...' \
     VPN_PASSWORDS='密码1 密码2 ...' \
     sh update_vpn_users.sh
     ```

##### 手动管理账户

首先，IPsec PSK （预共享密钥）保存在文件 `/etc/ipsec.secrets`。如果要更换一个新的 PSK，可以编辑此文件。完成后必须重启服务（见下面）。所有的 VPN 用户将共享同一个 IPsec PSK。
```
%any  %any  : PSK "你的IPsec预共享密钥"
```

对于 `IPsec/L2TP`，VPN 用户信息保存在文件 `/etc/ppp/chap-secrets`。该文件的格式如下：
```
"用户名1"  l2tpd  "密码1"  *
"用户名2"  l2tpd  "密码2"  *
... ...
```
你可以添加更多用户，每个用户对应文件中的一行。不要在用户名，密码或 PSK 中使用这些字符：`\ " '`

对于 `IPsec/XAuth ("Cisco IPsec")`，VPN 用户信息保存在文件 `/etc/ipsec.d/passwd`。该文件的格式如下：
```
用户名1:密码1的加盐哈希值:xauth-psk
用户名2:密码2的加盐哈希值:xauth-psk
... ...
```
这个文件中的密码以加盐哈希值的形式保存。该步骤可以借助比如 `openssl` 工具来完成：
```
# 以下命令的输出为：密码1的加盐哈希值
# 将你的密码用 '单引号' 括起来
openssl passwd -1 '密码1'
```

最后，如果你更改了 PSK，则必须重启服务。对于添加，更改或者删除 VPN 用户，一般不需重启。
```
service ipsec restart
service xl2tpd restart
```

### 2.2. 客户端

```
$ sudo add-apt-repository ppa:nm-l2tp/network-manager-l2tp
$ sudo apt-get update
$ sudo apt-get install network-manager-l2tp-gnome
$ sudo service xl2tpd stop
$ sudo update-rc.d xl2tpd disable
```

安装完软件包，执行以下步骤：

1. 进入 Settings -> Network -> VPN，单击 + 按钮。
2. 选择 Layer 2 Tunneling Protocol (L2TP)。
3. 在 Name 字段中输入任意内容。
4. 在 Gateway 字段中输入你的 VPN 服务器 IP。
5. 在 User name 字段中输入你的 VPN 用户名。
6. 右键单击 Password 字段中的 ?，选择 Store the password only for this user。
7. 在 Password 字段中输入你的 VPN 密码。
8. 保持 NT Domain 字段空白。
9. 单击 IPsec Settings... 按钮。
11. 选中 Enable IPsec tunnel to L2TP host 复选框。
12. 保持 Gateway ID 字段空白。
13. 在 Pre-shared key 字段中输入你的 VPN IPsec PSK。
14. 展开 Advanced 部分。
15. 在 Phase1 Algorithms 字段中输入 aes128-sha1-modp2048!。
16. 在 Phase2 Algorithms 字段中输入 aes128-sha1-modp2048!。
17. 单击 OK，然后单击 Add 保存 VPN 连接信息。

启用 VPN 连接。
