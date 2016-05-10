#Linux系统安装初始化脚本
##1. CentOS 7.x 系列
* [脚本功能](#dot)
    * 更新系统到最新
    * 安装 wget
    * 安装 net-tools
    * 安装 git
    * 安装 vim
    * 关闭并删除kdump
    * 设置vim的别名:alias vi=vim
    * 关闭SELINUX

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/wl1524520/linux-scripts/master/linux-init/centos7.sh)"
```
或者
```bash
sh -c "$(wget https://raw.githubusercontent.com/wl1524520/linux-scripts/master/linux-init/centos7.sh -O -)"
```

##2. Deepin 2015 系列
* [脚本功能](#dot)
    * 更新系统到最新
    * 安装 git
    * 安装 filezilla
    * 安装 vlc
    * 安装 vim
    * 安装谷歌字体和文泉驿字体
    * 安装fcitx框架以及安装谷歌拼音和五笔输入法
    * 安装GIMP
    * 安装并设置zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/wl1524520/linux-scripts/master/linux-init/deepin2015.sh)"
```
或者
```bash
sh -c "$(wget https://raw.githubusercontent.com/wl1524520/linux-scripts/master/linux-init/deepin2015.sh -O -)"
```

#3. Linux Mint and Linux Mint Debian Edition 2
安装git工具，将代码下载到本地，然后根据需要执行脚本。
```bash
git clone https://github.com/wl1524520/linux-scripts.git
```
然后切换到 linux-scripts/linux-init/mint 目录

#4. Gentoo Linux - Server
* [脚本功能](#dot)
    * 更新系统到最新
    * 安装 git
    * 安装 zsh
    * 安装 vim
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/wl1524520/linux-scripts/master/linux-init/gentoo/server/init-server.sh)"
```
