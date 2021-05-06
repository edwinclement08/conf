export CONF_PATH="$HOME/conf"
export PATH="$HOME/bin:$HOME/bin/common:$PATH"
export ZSH="$HOME/.oh-my-zsh"
# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

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

# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*:*:make:*' tag-order 'targets'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

# Zsh Specific configurations
unsetopt share_history
setopt menu_complete
setopt hist_ignore_dups
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting

# Help with Navigation
DIRSTACKSIZE=8
alias dh='dirs -v'
setopt autocd                   # if only directory path is entered, cd there.
setopt auto_pushd		# run pushd whenever cd is entered
setopt pushd_ignore_dups	# remove older duplicates from stack
setopt pushdminus		# flip behavior of +/-
# vim mode 
KEYTIMEOUT=1
set -o vi

# fzf
[ -f  /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f  /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh



# import OS specific stuff
source "${CONF_PATH}/.zshrc-`uname`"

# import all files in the zsh custom config path
source "$CONF_PATH/zsh_custom/path_modifications.sh"
for file in $CONF_PATH/zsh_custom/*; do
   source "$file"
done

# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh


export PATH="$HOME/bin/`uname`:$PATH"
export GOPATH=$HOME/coding/go

# TODO change this multi-OS
. /opt/asdf-vm/asdf.sh

# TODO install these for all oses
#  asdf 		Garuda ✓ 
#  ripgrep-all-bin 	Garuda ✓ 
#  fd			Garuda ✓ 
#  gitea-tea		Garuda ✓ 
#  paru			Garuda ✓ 
#  git-delta-bin	Garuda ✓  # required for lazygit
  
# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

[[ -e ~/.bstack-keys.zsh ]] && source ~/.bstack-keys.zsh
[[ -e ~/.personal-keys.zsh ]] && source ~/.personal-keys.zsh
export EDITOR=nvim


# Initialize the autocompletion
# autoload -Uz compinit && compinit -i
