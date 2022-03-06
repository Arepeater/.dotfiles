#!/bin/bash
# 一些全局变量


# $DOTFILES = $HOME/.dotfiles
#
#

# ver="2.0.4"
# changeLog="增加安装ShadowSocks脚本，BBR支持IBM LinuxONE"
arch=`uname -m`
virt=`systemd-detect-virt`
kernelVer=`uname -r`
TUN=$(cat /dev/net/tun 2>&1 | tr '[:upper:]' '[:lower:]')
Github_Proxy="https://ghproxy.com/"


#判断操作系统
CMD=("$(grep -i pretty_name /etc/os-release 2>/dev/null | cut -d \" -f2)" "$(hostnamectl 2>/dev/null | grep -i system | cut -d : -f2)""$(lsb_release -sd 2>/dev/null)""$(grep -i description /etc/lsb-release 2>/dev/null | cut -d \" -f2)""$(grep . /etc/redhat-release 2>/dev/null)""$(grep . /etc/issue 2>/dev/null | cut -d \\ -f1 | sed '/^[ ]*$/d')")

REGEX=("debian" "ubuntu" "centos|red hat|kernel|oracle linux|alma|rocky" "'amazon linux'" "alpine")
RELEASE=("Debian" "Ubuntu" "CentOS" "CentOS" "Alpine")

#执行操作系统命令
PACKAGE_INSTALL=("apt -y install" "apt -y install" "yum -y install" "yum -y install" "apk add -f")
PACKAGE_UPDATE=("apt -y update" "apt -y update" "yum -y update" "yum -y update" "apk update -f")

# 控制台字体
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}

red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}

yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}

# 数组判空以及赋值
for i in "${CMD[@]}"; do
    SYS="$i" && [[ -n $SYS ]] && break  #监测SYS是否为0，不为0则返回true
done

#echo ${#REGEX[@]} 获取数组长度

for ((int=0; int<${#REGEX[@]}; int++)); do
    [[ $(echo "$SYS" | tr '[:upper:]' '[:lower:]') =~ ${REGEX[int]} ]] && SYSTEM="${RELEASE[int]}" && [[ -n $SYSTEM ]] && break
done

[[ -z $SYSTEM ]] && red "不支持当前系统" && exit 1

# 更新系统及安装依赖
${PACKAGE_UPDATE[int]}
${PACKAGE_INSTALL[int]} curl wget sudo htop git zsh 

#if [ "$SYSTEM" = "Debian" ] || [ "$SYSTEM" = "Ubuntu" ]
#    then ${PACKAGE_INSTALL[int]} autojump fonts-powerline
#fi

#配置zsh+插件
##[1]备份原文件：

git clone "$Github_Proxy"https://github.com/Arepeater/.dotfiles.git $HOME/.dotfiles
mv $HOME/.dotfiles/.zshenv $HOME/
source $HOME/.zshenv
${PACKAGE_INSTALL[int]} autojump
git clone "$Github_Proxy"https://github.com/zdharma-continuum/fast-syntax-highlighting $ZDOTDIR/plugins/fsh
git clone "$Github_Proxy"https://github.com/zsh-users/zsh-autosuggestions $ZDOTDIR/plugins/zsh-autosuggestions
#更换默认Shell为zsh
chsh -s $(which zsh)

#SSH配置
#更改端口为：20223,关闭密码登陆，只能密钥登陆
mv /etc/ssh/sshd_config $DOTFILES/oldfiles.bak
wget -O /etc/ssh/sshd_config "$Github_Proxy"https://raw.githubusercontent.com/Arepeater/.dotfiles/main/ssh/sshd_config /etc/ssh


##配置sshkey登陆
:<<EOF
if [ ! -d "$HOME/.ssh" ]
then
    mkdir $HOME/.ssh
    touch $HOME/.ssh/authorized_keys
else
    mv $HOME/.ssh/authorized_keys /$DOTFILES/oldfiles.bak
fi
echo "ssh-rsa xxxx" > $HOME/.ssh/authorized_keys
chomd 400 touch $HOME/.ssh/authorized_keys
EOF


