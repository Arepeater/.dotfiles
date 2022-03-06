#引用快捷键
# +---------+
# # | ALIASES |
# # +---------+
#
source $ZDOTDIR/aliases.zsh

#配置颜色
# +--------+
# | COLORS |
# +--------+
#
# # Override colors
eval "$(dircolors -b $ZDOTDIR/dircolors.zsh)"

#修改命令行显示效果
# +--------+
# | PROMPT |
# +--------+

fpath=($ZDOTDIR/prompt $fpath)
source $ZDOTDIR/prompt/prompt_purification_setup.zsh


autoload -U compinit; compinit

#参数候选
# +------------+
# | COMPLETION |
# +------------+
#
source $ZDOTDIR/completion/completion_person.zsh

#额外插件
#Plugins
#source /usr/share/autojump/autojump.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/fsh/fast-syntax-highlighting.plugin.zsh
