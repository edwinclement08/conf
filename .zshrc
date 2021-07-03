#zmodload zsh/zprof
export CONF_PATH="$HOME/conf"
export PATH="$HOME/bin:$HOME/bin/common:$PATH"
export PATH="$PATH:/usr/local/bin"
export ZSH="$HOME/.oh-my-zsh"
# Set $PATH if ~/.local/bin exist
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

export FZF_DEFAULT_COMMAND='ag -l'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export EDITOR=vim

export GPG_TTY=$(tty)

ZSH_THEME="spaceship"

SPACESHIP_EXIT_CODE_SHOW=true # for showing the exit code of last command if it was non-zero
SPACESHIP_TIME_SHOW=true
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_NODE_DEFAULT_VERSION=12.10.0
SPACESHIP_BATTERY_THRESHOLD=50 # show battery remaining if it is less than 50%


plugins=(
  cp
  z
  yarn
  zsh-syntax-highlighting
  vi-mode
  docker
  docker-compose
  zsh-autosuggestions
  asdf
)

export RPS1="%{$reset_color%}"
source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5,underline"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf*' 'fg=white,bold,bg=red')

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# # Completion.
# zstyle ':completion:*:*:make:*' tag-order 'targets'
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
# zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
# zstyle ':completion:*' completer _expand _complete _ignored _approximate
# zstyle ':completion:*' menu select=2
# zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
# 
# # Speed up completions
# zstyle ':completion:*' accept-exact '*(N)'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
# autoload -U +X bashcompinit && bashcompinit

HISTFILE=~/.zhistory
HISTSIZE=50000
SAVEHIST=10000

# Zsh Specific configurations
# unsetopt share_history
setopt share_history
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
# Linux
[ -f  /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f  /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# Mac
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# import OS specific stuff
#source "${CONF_PATH}/.zshrc-`uname`"

# import all files in the zsh custom config path
source "$CONF_PATH/zsh_custom/path_modifications.sh"
for file in $CONF_PATH/zsh_custom/*; do
   source "$file"
done

# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
# [[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

export TERM=xterm-256color

function export_go() {
  export GOPATH=$HOME/go
  export GOROOT="$(brew --prefix golang)/libexec"
  export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
}

# TODO change this multi-OS
#. /opt/asdf-vm/asdf.sh # garuda
#. /usr/local/opt/asdf/asdf.sh # mac 

# TODO install these for all oses
#  asdf 		Garuda ✓ 
#  ripgrep-all-bin 	Garuda ✓ 
#  fd			Garuda ✓ 
#  gitea-tea		Garuda ✓ 
#  paru			Garuda ✓ 
#  git-delta-bin	Garuda ✓  # required for lazygit
#  lf-bin	Garuda ✓  # required for lazygit
#  gitmoji-cli	Garuda ✓  # required for lazygit
#  asciinema Garuda ✓ 
#  balena-etcher Garuda ✓ 
#  expac Garuda ✓ 
  

# Replace yay with paru if installed
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

[[ -e ~/.bstack-keys.zsh ]] && source ~/.bstack-keys.zsh
[[ -e ~/.personal-keys.zsh ]] && source ~/.personal-keys.zsh
[[ -e ~/.bs_secrets ]] && source ~/.bs_secrets
export EDITOR=nvim

export HOMEBREW_AUTO_UPDATE_SECS="172800"


export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# autoload -Uz compinit 
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
# else
# 	compinit -C;
# fi;

# timer=$(($(gdate +%s%N)/1000000)); echo $timer

setopt extendedglob
if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
  # If completion insecurities exist, warn the user without enabling completions.
  if ! compaudit &>/dev/null; then
    # This function resides in the "lib/compfix.zsh" script sourced above.
    handle_completion_insecurities
  # Else, enable and cache completions to the desired file.
  else
    if [[ -n "${ZSH_COMPDUMP}"(#qN.mh+24) ]]; then
      compinit -d "${ZSH_COMPDUMP}"
      compdump
    else
      compinit -C
    fi
  fi
else
  if [[ -n "${ZSH_COMPDUMP}"(#qN.mh+24) ]]; then
    compinit -i -d "${ZSH_COMPDUMP}"
    compdump
  else
    compinit -C
  fi
fi


#zprof
