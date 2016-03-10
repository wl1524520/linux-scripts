#Linux系统安装初始化脚本
##1. CentOS 7.x 系列
* [脚本功能](#dot)
    * 更新系统
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
