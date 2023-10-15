# +----+
# | ls |
# +----+

alias ls='ls --color=auto'
alias lsl='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias l='ls -CF'
cd() {
    builtin cd "$@" && ls -CF
}

# +----+
# | cp |
# +----+

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

# +--------+
# | python |
# +--------+

alias python='python3'
