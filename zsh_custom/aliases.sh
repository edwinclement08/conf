alias gpg=gpg2 
alias mysql=mycli

# zsh/bash
alias mv='mv -v'

alias gg='grv'

# Git aliases
alias g.s='git status -s'
alias g.ss='git status'
alias g.c='git commit -m'
alias g.l='git log'
alias g.a='git add . -A'
alias g.d='git diff --cached '
alias g.p='git push'
alias g.pp='git push origin master --set-upstream'
alias g.ac="git add . -A && git commit -m"

# Github Aliases
alias h.p.s="gh pr list -S"

# Gitea Aliases
source ~/conf/zsh_custom/gitea.sh

alias vim=nvim
alias v=vim
alias tt=tmuxinator

# Reload Configuration
alias zz='. ~/.zshrc'
alias zz.a='. ~/conf/zsh_custom/aliases.sh; . ~/conf/zsh_custom/aliases_with_completion.sh'
alias tt="tmux source ~/.tmux.conf"

# Edit Configuration
alias v.s="vim ~/.SpaceVim.d/init.toml"

# Edit Configuration, and reload 
alias v.t="vim ~/.tmux.conf; tt"
alias v.za="vim ~/conf/zsh_custom/aliases.sh; zz.a"
alias v.zc="vim ~/conf/zsh_custom; zz"
alias v.z="vim ~/.zshrc; zz"

# Directory Aliases
alias cdd="cd ~/Downloads"

# autovote
alias autovote=aur-auto-vote edwinclement08

# ESP-IDF
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias get_tty="ls -l /dev/tty* | egrep -v 'tty(S|[0-9])'"

# docker(& compose) stuff
alias d.c='docker-compose up'
alias d.c.b='docker-compose up --build'
alias d.ps='docker ps --format "table {{.Image}}\t{{.Names}}\t{{.Ports}}"'

# brew - no update
alias brew.i='HOMEBREW_NO_AUTO_UPDATE=1 brew install'

# Ruby
alias biwp="bundle install --without production"
alias rake='noglob rake' # Needed for preventing Zsh from breaking rake argumments

# cat
alias cat="bat"

# lazy git
alias lg="lazygit"
alias ll="l -hl -s extension"

# lazy docker
alias lzd='lazydocker'

# ping
alias ping='prettyping'

# fzf preview
alias p="fzf --preview 'bat --color \"always\" {}'"

# redis cli
alias redis-cli='iredis'

# Eve help
alias reconnect_mouse="ssh eve sh /boot/config/usbDevices/reconnect_mouse.sh"

# notify on MAC OS
function notify() {
  osascript -e "display notification \"$2\" with title \"$1\" sound name \"Glass\""
}


