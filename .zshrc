echo "Hello World!"

#引用快捷键
# +---------+
# # | ALIASES |
# # +---------+
#
source $ZDOTDIR/aliases.zsh

# +--------+
# # | COLORS |
# # +--------+
#
# # Override colors
eval "$(dircolors -b $ZDOTDIR/dircolors.zsh)"

# +--------+
# | PROMPT |
# +--------+

fpath=($ZDOTDIR/prompt $fpath)
source $ZDOTDIR/prompt/prompt_purification_setup.zsh


autoload -U compinit; compinit


# +------------+
# # | COMPLETION |
# # +------------+
#
source $ZDOTDIR/completion/completion_person.zsh

#Plugins
source /usr/share/autojump/autojump.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/fsh/fast-syntax-highlighting.plugin.zsh
