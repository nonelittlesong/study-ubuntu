# [Windows 安装 SSH](https://learn.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse?tabs=powershell&pivots=windows-server-2025)

## OpenSSH

Ctrl + Shift + Enter 运行 PowerShell：

1. 执行 `winver`，查看 Windows 设备的版本详细信息。
2. 运行 $PSVersionTable.PSVersion。 验证主要版本至少为 5，次要版本至少为 1。
3. 运行以下命令。 当你是内置 Administrator 组的成员时（管理员身份运行 PowerShell），输出将显示 True。
   ```sh
   (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
   ```

### 启用 OpenSSH 服务器

查看 OpenSSH 状态

```sh
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
```

安装 OpenSSH 服务

```sh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

### 启动 OpenSSH

启动 SSHD 服务

```sh
# Start the sshd service
Start-Service sshd
```

开机自启动

```sh
Set-Service -Name sshd -StartupType 'Automatic'
```

配置防火墙

```sh
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    # New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}
```

### 卸载

```sh
# Uninstall the OpenSSH Server
Remove-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```
