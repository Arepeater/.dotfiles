#!/usr/bin/env bash

## Reference_SRC:https://github.com/Phantas0s/.dotfiles/blob/master/install.sh
## Author:Arepeater

# Some global variables
export GithubMirror=''
export isTINY_ZSH='0'

# presentation
echo -e "
${yellow}

         _sudZUZ#Z#XZo=_         DDDD   EEEEEE BBBB   IIIIII  AAAA   NN   NN
      _jmZZ2!!~---~!!X##wa       DD DD  EE     BB BB    II   AA  AA  NNN  NN
   .<wdP~~            -!YZL,     DD  DD EEEEE  BBBBB    II   AAAAAA  NNNN NN
  .mX2'       _%aaa__     XZ[.   DD DD  EE     BB  BB   II   AA  AA  NN NNNN
  oZ[      _jdXY!~?S#wa   ]Xb;   DDDD   EEEEEE BBBBB  IIIIII AA  AA  NN   NN
 _#e'     .]X2(     ~Xw|  )XXc
.2Z`      ]X[.       xY|  ]oZ(   Linux Version 5.15.90.1-microsoft-standard-WS
.2#;      )3k;     _s!~   jXf`   Compiled #1 SMP Fri Jan 27 02:56:13 UTC 2023
 1Z>      -]Xb/    ~    __#2(    24 3.42GHz Intel i7 13700K Processors, 31.2GB RAM
 -Zo;       +!4ZwaaaauZZXY'      Debian No.1
  *#[,        ~-?!!!!!!-~
   XUb;.
    )YXL,,
      +3#bc,
        -)SSL,,
           ~~~~~
"

echo -e "${yellow}!!! ${red}WARNING${yellow} !!!"
echo -e "${light_red}This script will delete all your configuration files!"
echo -e "${light_red}Use it at your own risks."

if [ $# -ne 1 ] || [ "$1" != "-y" ];
    then
        echo -e "${yellow}Press a key to continue...\n"
        read key;
fi

# Check OS
REGEX=("debian|astra" "ubuntu" "centos|red hat|kernel|oracle linux|alma|rocky" "'amazon linux'" "fedora" "arch" "freebsd")
RELEASE=("Debian" "Ubuntu" "CentOS" "CentOS" "Fedora" "Arch" "FreeBSD")
PACKAGE_UPDATE=("! apt-get update && apt-get --fix-broken install -y && apt-get update" "apt-get update" "yum -y update" "yum -y update" "yum -y update" "pacman -Sy" "pkg update")
PACKAGE_INSTALL=("apt-get -y install" "apt-get -y install" "yum -y install" "yum -y install" "yum -y install" "pacman -Sy --noconfirm --needed" "pkg install -y")
PACKAGE_REMOVE=("apt-get -y remove" "apt-get -y remove" "yum -y remove" "yum -y remove" "yum -y remove" "pacman -Rsc --noconfirm" "pkg delete")
PACKAGE_UNINSTALL=("apt-get -y autoremove" "apt-get -y autoremove" "yum -y autoremove" "yum -y autoremove" "yum -y autoremove" "" "pkg autoremove")
CMD=("$(grep -i pretty_name /etc/os-release 2>/dev/null | cut -d \" -f2)" "$(hostnamectl 2>/dev/null | grep -i system | cut -d : -f2)" "$(lsb_release -sd 2>/dev/null)" "$(grep -i description /etc/lsb-release 2>/dev/null | cut -d \" -f2)" "$(grep . /etc/redhat-release 2>/dev/null)" "$(grep . /etc/issue 2>/dev/null | cut -d \\ -f1 | sed '/^[ ]*$/d')" "$(grep -i pretty_name /etc/os-release 2>/dev/null | cut -d \" -f2)" "$(uname -s)")
SYS="${CMD[0]}"
[[ -n $SYS ]] || exit 1
for ((int = 0; int < ${#REGEX[@]}; int++)); do
    if [[ $(echo "$SYS" | tr '[:upper:]' '[:lower:]') =~ ${REGEX[int]} ]]; then
        SYSTEM="${RELEASE[int]}"
        [[ -n $SYSTEM ]] && break
    fi
done

# Check incoming
while [[ $# -ge 1 ]]; do
  case $1 in
    -v|--ver)
      shift
      tmpVER="$1"
      shift
      ;;
    --mirror)
      shift
      if [[ $# -ge 1 ]] && [[ $1 != -* ]]; then
        GithubMirror="$1"
      else 
        GithubMirror="https://ghproxy.com/"
      fi
      shift
      ;;
    --tiny)
      shift
      if [[ $# -ge 1 ]] && [[ $1 != -* && $1 == "1" ]]; then
        isTINY_ZSH="1"
      fi
      shift
      ;;
    *)
      if [[ "$1" != 'error' ]]; then echo -ne "\nInvaild option: '$1'\n\n"; fi
      echo -ne " Usage:\n\tbash $(basename $0)\t--mirror [\033[33m\033[04mmirror address\033[0m]\n\t\t\t-tiny [\033[04m0/1\033[0m]\n\t\t\t\t\n"
      exit 1;
      ;;
    esac
done

# Install dependence
${PACKAGE_UPDATE[int]}
${PACKAGE_INSTALL[int]} autojump wget vim htop zsh git
git clone "$GithubMirror"https://github.com/Arepeater/.dotfiles.git ${HOME}/.dotfiles

# Copy the default config file if not present already
# includes
source ${HOME}/.dotfiles/zsh/zshenv
source ${HOME}/.dotfiles/colors.sh

# Install
. "$DOTFILES/install/install-zsh.sh"
