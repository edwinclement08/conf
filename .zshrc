export CONF_PATH="$HOME/conf"
export PATH="$HOME/bin:$HOME/bin/common:$PATH"
export ZSH="$HOME/.oh-my-zsh"

export FZF_DEFAULT_COMMAND='ag -l'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export EDITOR=vim

ZSH_THEME="spaceship"

SPACESHIP_TIME_SHOW=true
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_NODE_DEFAULT_VERSION=12.10.0

plugins=(
  cp
  z
  yarn
  zsh-syntax-highlighting
  rake-fast
  vi-mode
  docker
  docker-compose
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5,underline"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf*' 'fg=white,bold,bg=red')

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

zstyle ':completion:*:*:make:*' tag-order 'targets'

# Zsh Specific configurations
unsetopt share_history
setopt menu_complete
setopt hist_ignore_dups

# vim mode 
KEYTIMEOUT=1
set -o vi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# import all files in the zsh custom config path
for file in $CONF_PATH/zsh_custom/*; do
   source "$file"
done

source "${CONF_PATH}/.zshrc-`uname`"
export PATH="$HOME/bin/`uname`:$PATH"

# Initialize the autocompletion
autoload -Uz compinit && compinit -i