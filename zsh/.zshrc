# Preparations
mkdir -p ~/.cache/zsh
export ZSH_CACHE="$HOME/.cache/zsh"

# Set up the ALIASES
source $DOTFILES/zsh/aliases.zsh

# Override COLORS
eval "$(dircolors -b $DOTFILES/zsh/dircolors.zsh)"

# Use modern PROMPT
autoload -Uz promptinit
promptinit
prompt adam1

fpath=($DOTFILES/zsh/prompt $fpath)
source $DOTFILES/zsh/prompt/prompt_purification_setup.zsh

# Use modern COMPLETION
autoload -Uz compinit
compinit -d $ZSH_CACHE/.zcompdump
source $DOTFILES/zsh/completion/completion_person.zsh

# Plugins
source /usr/share/autojump/autojump.zsh
source $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $DOTFILES/zsh/plugins/fsh/fast-syntax-highlighting.plugin.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $DOTFILES/zsh/.p10k.zsh ]] || source $DOTFILES/zsh/.p10k.zsh
source $DOTFILES/zsh/.powerlevel10k/powerlevel10k.zsh-theme

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Optimize history storage
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$ZSH_CACHE/.zsh_history
setopt histignorealldups sharehistory

# WSL2
## Solve the problem that the file permission created by WSL2 under NTFS system is 777, 
## after modification: 755
if [[ "$(umask)" == '000' ]]; then
            umask 022
fi

## Fixed an issue where "code." for WSL2 would not work
#export PATH="$PATH:/mnt/c/Windows/System32:/mnt/d/Program Files (x86)/Microsoft VS Code/bin"
#export PATH=$PATH:'/mnt/d/Program Files (x86)/Microsoft VS Code/bin'
#export PATH=$PATH:'/home/stone/.vscode-server/bin/cfa2e218100323074ac1948c885448fdf4de2a7f/bin'

## Resolve WSL2 GPG signing failures
#export GPG_TTY=$(tty)
#export GPG_TTY="$(tty)"

## Fixed window name
# DISABLE_AUTO_TITLE=true
