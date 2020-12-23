## 打开一个新终端并运行指定程序
```sh
gnome-terminal -x bash -c "sh ./run.sh;exec bash;"
```
>`exec bash` 使终端保持开启状态。  

gnome-terminal:  

- `-x, --execute` - 

bash:  

- `-c` - 


## bash 介绍
shell 种类：  
- Bourne SHell(sh)  
- Bourne Again SHell(bash)  
- C SHell(csh)  
- KornSHell(ksh)  
- zsh  

### bash
bash 是 sh 的超集。  
- 记录历史命令 - 保存在 `~/.bash_history` 中（zsh 保存在 .zsh_history 中）。  
- alias 设置别名。  
- type 查看命令。  
