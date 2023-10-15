#!/usr/bin/env bash

# Reference_SRC:https://github.com/Phantas0s/.dotfiles/blob/master/install.sh

# Copy the default config file if not present already

############
# includes #
############

source ./zsh/zshenv
source ./colors.sh

################
# presentation #
################

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

###########
# INSTALL #
###########

# Install
. "$DOTFILES/install/install-zsh.sh"
