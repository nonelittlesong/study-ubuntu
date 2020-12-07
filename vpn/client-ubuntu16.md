# Ubuntu16.04 配置 VPN 客户端

使用 ubuntu16.04 配置 vpn 客户端时，遇到的问题和解决办法。

<details>
<summary>References</summary>

- [NetworkMananger-l2tp](https://github.com/nm-l2tp/NetworkManager-l2tp/blob/master/README.md)

</details>

## 1. 问题

### 1.1 密码错误

```diff
- pppd[24956]: CHAP authentication failed: Access denied
```

- [ppp](https://github.com/paulusmack/ppp) — Point-to-Point Protocol，点对点协议


## 2. 成功案例

### 2.1. VPN 连接配置文件

配置文件存放在

```
/etc/NetworkManager/system-connections/
```

查看 vpn 配置信息

```
[connection]
id=vultr
uuid=7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698
type=vpn
autoconnect=false
permissions=user:song:;
secondaries=

[vpn]
gateway=45.77.27.84
ipsec-psk=0seG1jcFNDSkhHVUZUWkt6N25KOUs=
user=vpnuser
ipsec-ike=aes128-sha1-modp2048!
password-flags=1
ipsec-enabled=yes
ipsec-esp=aes128-sha1-modp2048!
service-type=org.freedesktop.NetworkManager.l2tp

[ipv4]
dns-search=
method=auto

[ipv6]
addr-gen-mode=stable-privacy
dns-search=
ip6-privacy=0
method=auto
```

### 2.2. 运行时生成的文件

假设在编译时用了 `--localstatedir=/var` 或 `--runstatedir=/var/run` 配置选项，则在 `/var/run` 目录下有以下文件：

- /var/run/nm-l2tp-\<UUID>/xl2tpd.conf
- /var/run/nm-l2tp-\<UUID>/xl2tpd-control
- /var/run/nm-l2tp-\<UUID>/xl2tpd.pid
- /var/run/nm-l2tp-\<UUID>/ppp-options
- /var/run/nm-l2tp-\<UUID>/ipsec.conf
- /etc/ipsec.d/ipsec.nm-l2tp.secrets

如果使用 strongswan，运行时 NetworkManager-l2tp 会在 `/etc/ipsec.secrets` 的末尾添加

```
include ipsec.d/ipsec.nm-l2tp.secrets
```

### 2.3. 调试

查看日志

```
$ journalctl --unit=NetworkManager
```

查看更多日志

```
$ sudo killall -TERM nm-l2tp-service
$ sudo /usr/lib/NetworkManager/nm-l2tp-service --debug
```

<details>
<summary>正常连接的日志</summary>

```
nm-l2tp[3960] <debug> nm-l2tp-service (version 1.2.18) starting...
nm-l2tp[3960] <debug>  uses default --bus-name "org.freedesktop.NetworkManager.l2tp"
nm-l2tp[3960] <info>  ipsec enable flag: yes
** Message: Check port 1701
connection
	id : "vultr" (s)
	uuid : "7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698" (s)
	interface-name : NULL (sd)
	type : "vpn" (s)
	permissions : ["user:song:"] (s)
	autoconnect : FALSE (s)
	autoconnect-priority : 0 (sd)
	timestamp : 0 (sd)
	read-only : FALSE (sd)
	zone : NULL (sd)
	master : NULL (sd)
	slave-type : NULL (sd)
	autoconnect-slaves : ((NMSettingConnectionAutoconnectSlaves) NM_SETTING_CONNECTION_AUTOCONNECT_SLAVES_DEFAULT) (sd)
	secondaries : [] (s)
	gateway-ping-timeout : 0 (sd)
	metered : ((NMMetered) NM_METERED_UNKNOWN) (sd)
	lldp : -1 (sd)


ipv6
	method : "auto" (s)
	dns : [] (s)
	dns-search : [] (s)
	dns-options : NULL (sd)
	dns-priority : 0 (sd)
	addresses : ((GPtrArray*) 0x146bb40) (s)
	gateway : NULL (sd)
	routes : ((GPtrArray*) 0x146bb60) (s)
	route-metric : -1 (sd)
	ignore-auto-routes : FALSE (sd)
	ignore-auto-dns : FALSE (sd)
	dhcp-hostname : NULL (sd)
	dhcp-send-hostname : TRUE (sd)
	never-default : FALSE (sd)
	may-fail : TRUE (sd)
	dad-timeout : -1 (sd)
	dhcp-timeout : 0 (sd)
	ip6-privacy : ((NMSettingIP6ConfigPrivacy) NM_SETTING_IP6_CONFIG_PRIVACY_DISABLED) (s)
	addr-gen-mode : 1 (sd)


ipv4
	method : "auto" (s)
	dns : [] (s)
	dns-search : [] (s)
	dns-options : NULL (sd)
	dns-priority : 0 (sd)
	addresses : ((GPtrArray*) 0x146bc20) (s)
	gateway : NULL (sd)
	routes : ((GPtrArray*) 0x146bc40) (s)
	route-metric : -1 (sd)
	ignore-auto-routes : FALSE (sd)
	ignore-auto-dns : FALSE (sd)
	dhcp-hostname : NULL (sd)
	dhcp-send-hostname : TRUE (sd)
	never-default : FALSE (sd)
	may-fail : TRUE (sd)
	dad-timeout : -1 (sd)
	dhcp-timeout : 0 (sd)
	dhcp-client-id : NULL (sd)
	dhcp-fqdn : NULL (sd)


vpn
	service-type : "org.freedesktop.NetworkManager.l2tp" (s)
	user-name : "song" (s)
	persistent : FALSE (sd)
	data : ((GHashTable*) 0x1451360) (s)
	secrets : ((GHashTable*) 0x1451460) (s)
	timeout : 0 (sd)


nm-l2tp[3960] <info>  starting ipsec
Stopping strongSwan IPsec failed: starter is not running
Starting strongSwan 5.3.5 IPsec [starter]...
Loading config setup
Loading conn '7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698'
found netkey IPsec stack
nm-l2tp[3960] <info>  Spawned ipsec up script with PID 4089.
initiating Main Mode IKE_SA 7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698[1] to 45.77.27.84
generating ID_PROT request 0 [ SA V V V V ]
sending packet: from 192.168.43.49[500] to 45.77.27.84[500] (156 bytes)
received packet: from 45.77.27.84[500] to 192.168.43.49[500] (144 bytes)
parsed ID_PROT response 0 [ SA V V V ]
received FRAGMENTATION vendor ID
received DPD vendor ID
received NAT-T (RFC 3947) vendor ID
generating ID_PROT request 0 [ KE No NAT-D NAT-D ]
sending packet: from 192.168.43.49[500] to 45.77.27.84[500] (372 bytes)
received packet: from 45.77.27.84[500] to 192.168.43.49[500] (372 bytes)
parsed ID_PROT response 0 [ KE No NAT-D NAT-D ]
local host is behind NAT, sending keep alives
remote host is behind NAT
generating ID_PROT request 0 [ ID HASH ]
sending packet: from 192.168.43.49[4500] to 45.77.27.84[4500] (76 bytes)
received packet: from 45.77.27.84[4500] to 192.168.43.49[4500] (76 bytes)
parsed ID_PROT response 0 [ ID HASH ]
IKE_SA 7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698[1] established between 192.168.43.49[192.168.43.49]...45.77.27.84[45.77.27.84]
scheduling reauthentication in 9725s
maximum IKE_SA lifetime 10265s
generating QUICK_MODE request 3217173098 [ HASH SA No KE ID ID NAT-OA NAT-OA ]
sending packet: from 192.168.43.49[4500] to 45.77.27.84[4500] (460 bytes)
received packet: from 45.77.27.84[4500] to 192.168.43.49[4500] (428 bytes)
parsed QUICK_MODE response 3217173098 [ HASH SA No KE ID ID ]
CHILD_SA 7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698{1} established with SPIs c29a9f5a_i 7f96e53d_o and TS 192.168.43.49/32[udp/l2f] === 45.77.27.84/32[udp/l2f]
generating QUICK_MODE request 3217173098 [ HASH ]
connection '7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698' established successfully
nm-l2tp[3960] <info>  strongSwan IPsec tunnel is up.
** Message: xl2tpd started with pid 4098
xl2tpd[4098]: Not looking for kernel SAref support.
xl2tpd[4098]: Using l2tp kernel support.
xl2tpd[4098]: xl2tpd version xl2tpd-1.3.6 started on song-TM1604 PID:4098
xl2tpd[4098]: Written by Mark Spencer, Copyright (C) 1998, Adtran, Inc.
xl2tpd[4098]: Forked by Scott Balmos and David Stipp, (C) 2001
xl2tpd[4098]: Inherited by Jeff McAdams, (C) 2002
xl2tpd[4098]: Forked again by Xelerance (www.xelerance.com) (C) 2006
xl2tpd[4098]: Listening on IP address 0.0.0.0, port 1701
xl2tpd[4098]: get_call: allocating new tunnel for host 45.77.27.84, port 1701.
xl2tpd[4098]: Connecting to host 45.77.27.84, port 1701
xl2tpd[4098]: control_finish: message type is (null)(0).  Tunnel is 0, call is 0.
xl2tpd[4098]: control_finish: sending SCCRQ
xl2tpd[4098]: handle_avps: handling avp's for tunnel 1996, call 0
xl2tpd[4098]: message_type_avp: message type 2 (Start-Control-Connection-Reply)
xl2tpd[4098]: protocol_version_avp: peer is using version 1, revision 0.
xl2tpd[4098]: framing_caps_avp: supported peer frames: async sync
xl2tpd[4098]: bearer_caps_avp: supported peer bearers:
xl2tpd[4098]: firmware_rev_avp: peer reports firmware version 1680 (0x0690)
xl2tpd[4098]: hostname_avp: peer reports hostname 'vultrguest'
xl2tpd[4098]: vendor_avp: peer reports vendor 'xelerance.com'
xl2tpd[4098]: assigned_tunnel_avp: using peer's tunnel 61612
xl2tpd[4098]: receive_window_size_avp: peer wants RWS of 4.  Will use flow control.
xl2tpd[4098]: control_finish: message type is Start-Control-Connection-Reply(2).  Tunnel is 61612, call is 0.
xl2tpd[4098]: control_finish: sending SCCCN
xl2tpd[4098]: Connection established to 45.77.27.84, 1701.  Local: 1996, Remote: 61612 (ref=0/0).
xl2tpd[4098]: Calling on tunnel 1996
xl2tpd[4098]: control_finish: message type is (null)(0).  Tunnel is 61612, call is 0.
xl2tpd[4098]: control_finish: sending ICRQ
xl2tpd[4098]: handle_avps: handling avp's for tunnel 1996, call 12580
xl2tpd[4098]: message_type_avp: message type 11 (Incoming-Call-Reply)
xl2tpd[4098]: assigned_call_avp: using peer's call 25881
xl2tpd[4098]: control_finish: message type is Incoming-Call-Reply(11).  Tunnel is 61612, call is 25881.
xl2tpd[4098]: control_finish: Sending ICCN
xl2tpd[4098]: Call established with 45.77.27.84, Local: 12580, Remote: 25881, Serial: 1 (ref=0/0)
xl2tpd[4098]: start_pppd: I'm running: 
xl2tpd[4098]: "/usr/sbin/pppd" 
xl2tpd[4098]: "passive" 
xl2tpd[4098]: "nodetach" 
xl2tpd[4098]: ":" 
xl2tpd[4098]: "debug" 
xl2tpd[4098]: "file" 
xl2tpd[4098]: "/var/run/nm-l2tp-7b3a7bdb-ab4c-4cbe-9a5b-6195c86b1698/ppp-options" 
xl2tpd[4098]: "plugin" 
xl2tpd[4098]: "pppol2tp.so" 
xl2tpd[4098]: "pppol2tp" 
xl2tpd[4098]: "7" 
```

</details>