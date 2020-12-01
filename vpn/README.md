# 科学上网

<details>
<summary>References</summary>

- https://github.com/hwdsl2/setup-ipsec-vpn  
- https://github.com/Nyr/openvpn-install  
- [Ubuntu 16.04 Connecting to L2TP over IPSEC via Network Manager](https://hkdb.medium.com/ubuntu-16-04-connecting-to-l2tp-over-ipsec-via-network-manager-204b5d475721)

</details>

## OpenVPN 客户端

>ubuntu16 的 openvpn 版本是2.3！！ 

:warning: 我没有 OpenVPN 的服务器，没有测试过

```sh
$ sudo apt install openvpn
$ openvpn --version
```

将服务器的配置文件（.ovpn）复制到客户端 `/etc/openvpn` 中。  

## IPsec
```sh
wget https://git.io/vpnsetup-centos -O vpnsetup.sh && sh vpnsetup.sh

# 更新
ipsec --version
wget https://git.io/vpnupgrade-centos -O vpnupgrade.sh
```

**客户端**

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
