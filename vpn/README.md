
- https://github.com/hwdsl2/setup-ipsec-vpn  
- https://github.com/Nyr/openvpn-install  

>ubuntu16 的 openvpn 版本是2.3！！  

## OpenVPN 客户端
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
