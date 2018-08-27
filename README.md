# study-ubuntu
Notes of ubuntu.
## wiki
* [ssh](https://github.com/nonelittlesong/study-ubuntu/wiki/SSH)
* [git]()
* [pip]()
* [labelimg]()
* [ip设置]()
* 
## Shortcuts
* `ctrl+shift+t`:在原窗口打开终端
* `将窗体托向屏幕两侧实现分屏`

## Commands
#### rename file
```
rm fromfilename tofilename
```
#### 卸载cmake
```
sudo apt-get remove cmake
```
The following packages were automatically installed and are no longer required:  
&nbsp;&nbsp;cmake-data libjsoncpp1  
Use 'sudo apt autoremove' to remove them.  
## Troubleshooting
**（1）版本更新后输入法出现问题**  
>打开设置  
>点击Manager Installed Languages  
>Keyboard input method system:里面有Ibus,XIM(fcitx).none 三种输入架构，如果使用智能拼音就选Ibus，搜狗输入法的话就选XIM。  
>回到设置input source，选择中文输入法  
>重启电脑  

